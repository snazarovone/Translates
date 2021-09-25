//
//  TabBarAssembly.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol TabBarAssemblable: TabBarViewProtocol, TabBarPresenterOutput {}

enum TabBarAssembly {
    
    static func assembly(with output: TabBarPresenterOutput) {
        let interactor = TabBarInteractor()
        let presenter = TabBarPresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output = output
        output.presenter = presenter
    }
    
}
