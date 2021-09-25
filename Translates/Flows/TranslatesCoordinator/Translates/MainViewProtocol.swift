//
//  MainViewProtocol.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Foundation

protocol MainViewProtocol: BaseViewProtocol {
    
    var onCompletion: CompletionBlock? { get set }
    
}
