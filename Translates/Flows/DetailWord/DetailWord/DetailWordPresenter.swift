//
//  DetailWordPresenter.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

protocol DetailWordPresenterInput: AnyObject {
    func onStart()
    func addToDictionary()
    func removeFromDictionary()
}

protocol DetailWordPresenterOutput: AnyObject {
    
    var presenter: DetailWordPresenterInput? { get set }
    
    func setTitleNavigation(with text: String)
    func prepareData(word: String,
                     meaning: MeaningsModel,
                     model: MeaningsResponseModel?)
    func loadingData(_ animating: Bool)
}

final class DetailWordPresenter {

    weak var output: DetailWordPresenterOutput?
    
    var interactor: DetailWordInteractor?
    
    private let input: DetailWordPresenter.Input
    private var meanings: MeaningsResponseModel?
    
    init(_ input: DetailWordPresenter.Input) {
        self.input = input
    }
    
    func success(with model: [MeaningsResponseModel]) {
        self.meanings = model.first
        output?.loadingData(false)
        prepareData()
    }
    
    func failer() {
        output?.loadingData(false)
    }
}

private extension DetailWordPresenter {
    func prepareData() {
        output?.setTitleNavigation(with: input.word)
        output?.prepareData(
            word: input.word,
            meaning: input.meaning,
            model: meanings
        )
    }
}

// MARK: - DetailWordPresenterInput

extension DetailWordPresenter: DetailWordPresenterInput {
    func onStart() {
        output?.loadingData(true)
        prepareData()
        interactor?.meanings(with: "\(input.meaning.id)")
    }
    
    func addToDictionary() {
    }
    
    func removeFromDictionary() {
    }
}

extension DetailWordPresenter {
    struct Input {
        var word: String
        var meaning: MeaningsModel
    }
}
