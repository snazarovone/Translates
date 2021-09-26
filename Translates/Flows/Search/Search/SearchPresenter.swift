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
    
    /// Проверка существования страниц
    func isReachedEndOfItems() -> Bool
    /// Будет показана последняя ячейка
    func willDisplayLastCell()
    
    /// Было выбрано слово
    func didSelectWord(with meaning: MeaningsModel)
}

protocol SearchPresenterOutput: AnyObject {
    
    var presenter: SearchPresenterInput? { get set }
    
    /// Показать полную информацию о  слове
    var onDetailWord: DetailWordBlock? { get set }
    
    func prepareData(with data: [SearchResponseModel])
    func loadingData(_ animating: Bool)
}

final class SearchPresenter {

    weak var output: SearchPresenterOutput?
    
    var interactor: SearchInteractor?
    
    private var searchWords = [SearchResponseModel]()
    
    private var page = 1
    /// a flag for when all database items have already been loaded
    private var reachedEndOfItems = false
    private var textSearch = ""
    
    func onSuccessSearch(with data: SearchResponseData, is add: Bool) {
        if add {
            searchWords.append(contentsOf: data)
        } else {
            searchWords = data
        }
        
        reachedEndOfItems = data.isEmpty ? true : false
        output?.loadingData(false)
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
        
        textSearch = text
        output?.loadingData(true)
        interactor?.searchText(
            with: SearchRequest(search: text),
            is: false
        )
    }
    
    func didRemovedTextFromSearch() {
        textSearch = ""
        searchWords.removeAll()
        reachedEndOfItems = false
        output?.prepareData(with: searchWords)
    }
    
    func isReachedEndOfItems() -> Bool {
        reachedEndOfItems
    }
    
    func willDisplayLastCell() {
        if reachedEndOfItems == false {
            page += 1
            output?.loadingData(true)
            interactor?.searchText(
                with: SearchRequest(search: textSearch, page: page),
                is: true
            )
        } else {
            output?.loadingData(false)
        }
    }
    
    func didSelectWord(with meaning: MeaningsModel) {
        output?.onDetailWord?(
            DetailWordPresenter.Input(meaning: meaning)
        )
    }
}
