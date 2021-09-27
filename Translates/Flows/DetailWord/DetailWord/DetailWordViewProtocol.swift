//
//  DetailWordViewProtocol.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

protocol DetailWordViewProtocol: BaseViewProtocol {
    
    var onCompletion: CompletionBlock? { get set }
    
}