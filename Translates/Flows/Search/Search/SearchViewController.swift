//
//  SearchViewController.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

/**
 Поиск
 */
class SearchViewController: BaseViewController, SearchAssemblable, KeyboardNotifications {

    var presenter: SearchPresenterInput?
    
    var onCompletion: CompletionBlock?
    var onDetailWord: DetailWordBlock?
    
    private let searchBar = SearchBarTranslate()
    private let placeholderView = SearchPlaceholder()
    
    var dataSource: SearchDataSource?
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.estimatedSectionHeaderHeight = 54
        tv.estimatedRowHeight = 54
        tv.keyboardDismissMode = .onDrag
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .tWhite
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForKeyboardNotifications()
        navController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func initUI() {
        view.addSubviews(placeholderView, tableView, searchBar)
        
        tableView.delegate = self
        dataSource = SearchDataSource(tableView: tableView)
        
        presenter?.onStart()
    }
    
    override func initConstraints() {
        searchBar.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(topbarHeight)
        }
        
        placeholderView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(32)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func keyboardWillChange(height: CGFloat) {
        let margin = height == 0 ? 0 : -height + 64
        tableView.snp.updateConstraints { make in
            make.bottom.equalToSuperview().offset(margin)
        }
        placeholderView.snp.updateConstraints { make in
            make.centerY.equalToSuperview().offset(margin/2)
        }
    }
    
    override func initListeners() {
        searchBar.searchWithText = { [weak self] text in
            // Выполнить запрос поиска по кнопке поиск
            self?.presenter?.didEnteredSearch(with: text)
        }
        
        searchBar.textDidChange = { [weak self] text in
            self?.presenter?.didEnteredSearch(with: text)
        }
        
        searchBar.didTapDeleteKey = { [weak self] in
            self?.presenter?.didRemovedTextFromSearch()
        }
        
        dataSource?.addWordToDictionary = { [weak self] word in
            self?.presenter?.didAddWordToDictionary(with: word)
        }
    }

    deinit {
        print("SearchViewController is deinit")
    }
}

// MARK: - SearchPresenterOutput

extension SearchViewController {
    func prepareData(with data: [SearchResponseModel],
                     my words: [MeaningsModel]) {
        placeholderView.isHidden = !data.isEmpty
        dataSource?.prepareData(with: data, my: words)
    }
    
    func loadingData(_ animating: Bool) {
        DispatchQueue.main.async {
            if animating {
                self.tableView.startLoading()
            } else {
                self.tableView.stopLoading()
            }
        }
    }
}
