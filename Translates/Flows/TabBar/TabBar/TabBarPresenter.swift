//
//  TabBarPresenter.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol TabBarPresenterInput: AnyObject {
    // TODO: presentation input methods
}

protocol TabBarPresenterOutput: AnyObject {
    
    var presenter: TabBarPresenterInput? { get set }
    
    // TODO: presentation output methods
}

final class TabBarPresenter {

    weak var output: TabBarPresenterOutput?
    
    var interactor: TabBarInteractor?
    
    // TODO: implement interactor methods
}

// MARK: - TabBarPresenterInput

extension TabBarPresenter: TabBarPresenterInput {
    // TODO: implement input presentation methods

}