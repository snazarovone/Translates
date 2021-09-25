//
//  SearchPresenter.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol SearchPresenterInput: AnyObject {
    /**
     Был введен текст поиска
     - Parameter text - Введеный текст
     */
    func didEnteredSearch(with text: String?)
    
    /**
     SearchBar был отчищен
     */
    func didRemovedTextFromSearch()
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
    
    func didEnteredSearch(with text: String?) {
        interactor?.searchText(
            with: SearchRequest(search: text ?? ""),
            is: false
        )
    }
    
    func didRemovedTextFromSearch() {
    }
}
