//
//  DictionaryPresenter.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol DictionaryPresenterInput: AnyObject {
}

protocol DictionaryPresenterOutput: AnyObject {
    
    var presenter: DictionaryPresenterInput? { get set }
    
    // TODO: presentation output methods
}

final class DictionaryPresenter {

    weak var output: DictionaryPresenterOutput?
    
    var interactor: DictionaryInteractor?
    
    // TODO: implement interactor methods
}

// MARK: - DictionaryPresenterInput

extension DictionaryPresenter: DictionaryPresenterInput {
    // TODO: implement input presentation methods

}
