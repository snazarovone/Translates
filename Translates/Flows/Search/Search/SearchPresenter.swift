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
    
    func prepareData(with data: [SearchResponseModel])
}

final class SearchPresenter {

    weak var output: SearchPresenterOutput?
    
    var interactor: SearchInteractor?
    
    private var searchWords = [SearchResponseModel]()
    
    /// a flag for when all database items have already been loaded
    private var reachedEndOfItems = false
    
    func onSuccessSearch(with data: SearchResponseData, is add: Bool) {
        if add {
            searchWords.append(contentsOf: data)
        } else {
            searchWords = data
        }
        
        reachedEndOfItems = data.isEmpty ? true : false
        
        output?.prepareData(with: searchWords)
    }
}

// MARK: - SearchPresenterInput

extension SearchPresenter: SearchPresenterInput {
    
    func didEnteredSearch(with text: String?) {
        guard let text = text, !text.isEmpty else {
            didRemovedTextFromSearch()
            return
        }
        interactor?.searchText(
            with: SearchRequest(search: text),
            is: false
        )
    }
    
    func didRemovedTextFromSearch() {
        searchWords.removeAll()
        reachedEndOfItems = false
        output?.prepareData(with: searchWords)
    }
}
