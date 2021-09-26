//
//  DetailWordViewController.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

/**
 Полная информация о слове
 */
class DetailWordViewController: BaseViewController, DetailWordAssemblable {
    
    var presenter: DetailWordPresenterInput?
    
    var onCompletion: CompletionBlock?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .tWhite
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navController?.setNavigationBarHidden(false, animated: true)
    }

    deinit {
        print("DetailWordViewController is deinit")
    }
}

// MARK: - DetailWordPresenterOutput

extension DetailWordViewController {
    
// TODO: implement output presentation methods
    
}
