//
//  SearchAssembly.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol SearchAssemblable: SearchViewProtocol, SearchPresenterOutput {}

enum SearchAssembly {
    
    static func assembly(with output: SearchPresenterOutput) {
        let interactor = SearchInteractor()
        let presenter = SearchPresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output = output
        output.presenter = presenter
    }
    
}
