//
//  DialogRemoveAssembly.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//  
//

import UIKit

protocol DialogRemoveAssemblable: DialogRemoveViewProtocol, DialogRemovePresenterOutput {}

enum DialogRemoveAssembly {
    
    static func assembly(with output: DialogRemovePresenterOutput) {
        let interactor = DialogRemoveInteractor()
        let presenter = DialogRemovePresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output = output
        output.presenter = presenter
    }
    
}
