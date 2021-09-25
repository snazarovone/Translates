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
class SearchViewController: BaseViewController, SearchAssemblable {
    
    var presenter: SearchPresenterInput?
    
    var onCompletion: CompletionBlock?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navController?.setNavigationBarHidden(false, animated: true)
    }

    deinit {
        print("SearchViewController is deinit")
    }
}

// MARK: - SearchPresenterOutput

extension SearchViewController {
    
// TODO: implement output presentation methods
    
}
