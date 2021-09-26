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
}

protocol DetailWordPresenterOutput: AnyObject {
    
    var presenter: DetailWordPresenterInput? { get set }
    
    func setTitleNavigation(with text: String)
    func prepareData(word: String, meaning: MeaningsModel)
}

final class DetailWordPresenter {

    weak var output: DetailWordPresenterOutput?
    
    var interactor: DetailWordInteractor?
    
    private let input: DetailWordPresenter.Input
    
    init(_ input: DetailWordPresenter.Input) {
        self.input = input
    }
}

// MARK: - DetailWordPresenterInput

extension DetailWordPresenter: DetailWordPresenterInput {
    func onStart() {
        output?.setTitleNavigation(with: input.word)
        output?.prepareData(word: input.word, meaning: input.meaning)
    }
}

extension DetailWordPresenter {
    struct Input {
        var word: String
        var meaning: MeaningsModel
    }
}
