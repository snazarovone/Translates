//
//  MainViewController.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    var onCompletion: CompletionBlock?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
    }
}
