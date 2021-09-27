//
//  DialogRemovePresenter.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//  
//

import UIKit

protocol DialogRemovePresenterInput: AnyObject {
    func removeAllWords()
}

protocol DialogRemovePresenterOutput: AnyObject {
    
    var presenter: DialogRemovePresenterInput? { get set }
    
    // TODO: presentation output methods
}

final class DialogRemovePresenter {

    weak var output: DialogRemovePresenterOutput?
    
    var interactor: DialogRemoveInteractor?
    
    private let realmService = RealmService.shared
}

// MARK: - DialogRemovePresenterInput

extension DialogRemovePresenter: DialogRemovePresenterInput {
    func removeAllWords() {
        realmService.removeAll()
    }
}
