//
//  DetailWordAssembly.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

protocol DetailWordAssemblable: DetailWordViewProtocol, DetailWordPresenterOutput {}

enum DetailWordAssembly {
    
    static func assembly(with output: DetailWordPresenterOutput,
                         by input: DetailWordPresenter.Input) {
        let interactor = DetailWordInteractor()
        let presenter = DetailWordPresenter(input)
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output = output
        output.presenter = presenter
    }
    
}
