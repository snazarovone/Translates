//
//  DictionaryFactory.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Foundation

protocol DictionaryFactory {
    
    /// Словарь
    func makeDictionaryView() -> DictionaryViewProtocol
    
}
