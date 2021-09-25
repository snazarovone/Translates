//
//  SearchPresenter.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol SearchPresenterInput: AnyObject {
    // TODO: presentation input methods
}

protocol SearchPresenterOutput: AnyObject {
    
    var presenter: SearchPresenterInput? { get set }
    
    // TODO: presentation output methods
}

final class SearchPresenter {

    weak var output: SearchPresenterOutput?
    
    var interactor: SearchInteractor?
    
    // TODO: implement interactor methods
}

// MARK: - SearchPresenterInput

extension SearchPresenter: SearchPresenterInput {
    // TODO: implement input presentation methods

}