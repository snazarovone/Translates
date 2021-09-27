//
//  TranslateLauncherAssembly.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol TranslateLauncherAssemblable: TranslateLauncherViewProtocol, TranslateLauncherPresenterOutput {}

enum TranslateLauncherAssembly {
    
    static func assembly(with output: TranslateLauncherPresenterOutput) {
        let interactor = TranslateLauncherInteractor()
        let presenter = TranslateLauncherPresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output = output
        output.presenter = presenter
    }
    
}
