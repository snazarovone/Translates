//
//  TranslateLauncherPresenter.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol TranslateLauncherPresenterInput: AnyObject {
    // TODO: presentation input methods
}

protocol TranslateLauncherPresenterOutput: AnyObject {
    
    var presenter: TranslateLauncherPresenterInput? { get set }
    
    // TODO: presentation output methods
}

final class TranslateLauncherPresenter {

    weak var output: TranslateLauncherPresenterOutput?
    
    var interactor: TranslateLauncherInteractor?
    
    // TODO: implement interactor methods
}

// MARK: - TranslateLauncherPresenterInput

extension TranslateLauncherPresenter: TranslateLauncherPresenterInput {
    // TODO: implement input presentation methods

}