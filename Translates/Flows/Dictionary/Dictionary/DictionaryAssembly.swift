//
//  DictionaryAssembly.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol DictionaryAssemblable: DictionaryViewProtocol, DictionaryPresenterOutput {}

enum DictionaryAssembly {
    
    static func assembly(with output: DictionaryPresenterOutput) {
        let interactor = DictionaryInteractor()
        let presenter = DictionaryPresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output = output
        output.presenter = presenter
    }
    
}
