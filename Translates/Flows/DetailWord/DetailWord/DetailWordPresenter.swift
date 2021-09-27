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
    func dictionaryAction()
}

protocol DetailWordPresenterOutput: AnyObject {
    
    var presenter: DetailWordPresenterInput? { get set }
    
    func setTitleNavigation(with text: String)
    func prepareData(word: String,
                     meaning: MeaningsModel,
                     model: MeaningsResponseModel?)
    func loadingData(_ animating: Bool)
    func updateStyleAction(with type: StyleButton)
}

final class DetailWordPresenter {

    weak var output: DetailWordPresenterOutput?
    
    var interactor: DetailWordInteractor?
    
    private let input: DetailWordPresenter.Input
    private var meanings: MeaningsResponseModel?
    
    private let realmService = RealmService.shared
    private var styleButton = StyleButton.add(title: "add_dictionary".localized)
    
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
        output?.setTitleNavigation(with: input.word ?? meanings?.text ?? "")
        output?.prepareData(
            word: input.word ?? meanings?.text ?? "",
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
        
        if realmService.getWordModel(by: input.meaning.id) != nil {
            styleButton = StyleButton.remove(title: "remove_dictionaty".localized)
        }
        output?.updateStyleAction(with: styleButton)
    }
    
    func dictionaryAction() {
        switch styleButton {
        case .add:
            realmService.updateWord(input.meaning)
            styleButton = StyleButton.remove(title: "remove_dictionaty".localized)
            output?.updateStyleAction(with: styleButton)
        case .remove:
            realmService.removeObjectWordModel(by: input.meaning.id)
            styleButton = StyleButton.add(title: "add_dictionary".localized)
            output?.updateStyleAction(with: styleButton)
        default:
            break
        }
    }
}

extension DetailWordPresenter {
    struct Input {
        var word: String?
        var meaning: MeaningsModel
    }
}
