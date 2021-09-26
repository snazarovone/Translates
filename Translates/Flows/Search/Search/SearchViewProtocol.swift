//
//  SearchViewProtocol.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

typealias DetailWordBlock = ((DetailWordPresenter.Input) -> Void)

protocol SearchViewProtocol: BaseViewProtocol {
    
    var onCompletion: CompletionBlock? { get set }
    
    /// Показать полную информацию о  слове
    var onDetailWord: DetailWordBlock? { get set }
}
