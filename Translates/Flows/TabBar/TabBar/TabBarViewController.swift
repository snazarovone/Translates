//
//  TabBarViewController.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

class TabBarViewController: UITabBarController, TabBarAssemblable, TabBarViewProtocol {

    var presenter: TabBarPresenterInput?
    
    var onCompletion: CompletionBlock?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.tintColor = .tBlack
        tabBar.isTranslucent = false
        
    }
}
