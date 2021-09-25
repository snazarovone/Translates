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
    
    private let searchBar = SearchBarTranslate()
    private let placeholderView = SearchPlaceholder()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .tWhite
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func initUI() {
        view.addSubviews(searchBar, placeholderView)
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
    }
    
    func keyboardWillChange(height: CGFloat) {
    }
    
    override func initListeners() {
        searchBar.searchWithText = { [weak self] text in
            // Выполнить запрос поиска по кнопке поиск
            print(text)
        }
        
        searchBar.textDidChange = { [weak self] text in
            // текс
            print(text)
        }
        
        searchBar.didTapDeleteKey = { [weak self] in
            print("delete")
        }
    }

    deinit {
        print("SearchViewController is deinit")
    }
}

// MARK: - SearchPresenterOutput

extension SearchViewController {
    
// TODO: implement output presentation methods
    
}
