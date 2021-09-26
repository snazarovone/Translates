//
//  DetailWordFactory.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import Foundation

protocol DetailWordFactory {
    
    /// Полная информация о слове
    func makeDetailWordView(with input: DetailWordPresenter.Input)
    -> DetailWordViewProtocol
    
}
