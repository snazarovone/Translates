//
//  DictionaryPresenter.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol DictionaryPresenterInput: AnyObject {
    func onStart()
    /**
     Был введен текст поиска
     - Parameter text - Введеный текст
     */
    func didEnteredSearch(with text: String?)
    
    /**
     SearchBar был отчищен
     */
    func didRemovedTextFromSearch()
    
    /// Было выбрано слово
    func didSelectWord(with meaning: MeaningsModel,
                       searchWord: String?)
}

protocol DictionaryPresenterOutput: AnyObject {
    
    var presenter: DictionaryPresenterInput? { get set }
    
    /// Показать полную информацию о  слове
    var onDetailWord: DetailWordBlock? { get set }
    
    func prepareData(with data: [MeaningsModel])
    
    func setEnabledRemoveAllBtn(is enabled: Bool)
}

final class DictionaryPresenter {

    weak var output: DictionaryPresenterOutput?
    
    var interactor: DictionaryInteractor?
    private var textSearch: String?
    
    func reloadData(with words: [MeaningsModel]) {
        output?.setEnabledRemoveAllBtn(is: !(interactor?.words.isEmpty ?? false))
        output?.prepareData(with: words)
    }
}

// MARK: - DictionaryPresenterInput

extension DictionaryPresenter: DictionaryPresenterInput {
    func onStart() {
        interactor?.observeCategory()
    }
    
    func didEnteredSearch(with text: String?) {
        textSearch = text
        guard let text = text else {
            reloadData(with: interactor?.words ?? [])
            return
        }
        let filterWords = interactor?.words.filter({
            $0.translation?.text?.lowercased().range(of: text.lowercased()) != nil
        })
        reloadData(with: filterWords ?? [])
    }
    
    func didRemovedTextFromSearch() {
        textSearch = nil
        reloadData(with: interactor?.words ?? [])
    }
    
    func didSelectWord(with meaning: MeaningsModel, searchWord: String?) {
        output?.onDetailWord?(
            DetailWordPresenter.Input(word: searchWord, meaning: meaning)
        )
    }
}
