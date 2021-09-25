//
//  DictionaryViewController.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

    /**
     Dictionary краткое описание контролера
     */
class DictionaryViewController: BaseViewController, DictionaryAssemblable {

    var presenter: DictionaryPresenterInput?
    
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
        print("DictionaryViewController is deinit")
    }
}

// MARK: - DictionaryPresenterOutput

extension DictionaryViewController {
    
// TODO: implement output presentation methods
    
}