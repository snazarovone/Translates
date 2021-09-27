//
//  DictionaryViewController.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

/**
 Мой словарь
 */
class DictionaryViewController: BaseViewController, DictionaryAssemblable, WithNavigationItem, KeyboardNotifications {
    
    var presenter: DictionaryPresenterInput?
    
    var onCompletion: CompletionBlock?
    var onDetailWord: DetailWordBlock?
    var onDialogRemove: (() -> Void)?
    
    private let searchBar = SearchBarTranslate()
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.estimatedSectionHeaderHeight = 54
        tv.estimatedRowHeight = 54
        tv.keyboardDismissMode = .onDrag
        return tv
    }()

    var dataSource: DictionaryDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .tWhite
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForKeyboardNotifications()
        navController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func initUI() {
        title = "my_dict_title".localized
        
        view.addSubviews(tableView, searchBar)
        dataSource = DictionaryDataSource(tableView: tableView)
        tableView.delegate = self
        
        presenter?.onStart()
    }
    
    override func initConstraints() {
        searchBar.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(topbarHeight + 44)
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
    }
    
    override func initListeners() {
        searchBar.searchWithText = { [weak self] text in
            self?.presenter?.didEnteredSearch(with: text)
        }
        
        searchBar.textDidChange = { [weak self] text in
            self?.presenter?.didEnteredSearch(with: text)
        }
        
        searchBar.didTapDeleteKey = { [weak self] in
            self?.presenter?.didRemovedTextFromSearch()
        }
        
        navigationItem(set: .right(type: .removeAll)) { [weak self] _ in
            self?.onDialogRemove?()
        }
    }


    deinit {
        print("DictionaryViewController is deinit")
    }
}

// MARK: - DictionaryPresenterOutput

extension DictionaryViewController {
    func prepareData(with data: [MeaningsModel]) {
        dataSource?.prepareData(with: data)
    }
    
    func setEnabledRemoveAllBtn(is enabled: Bool) {
        navigationItem.rightBarButtonItem?.isEnabled = enabled
    }
}
