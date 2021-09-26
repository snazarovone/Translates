//
//  DetailWordPresenter.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

protocol DetailWordPresenterInput: AnyObject {
    // TODO: presentation input methods
}

protocol DetailWordPresenterOutput: AnyObject {
    
    var presenter: DetailWordPresenterInput? { get set }
    
    // TODO: presentation output methods
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
    // TODO: implement input presentation methods

}

extension DetailWordPresenter {
    struct Input {
        var meaning: MeaningsModel
    }
}
