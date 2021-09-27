//
//  DialogRemoveViewProtocol.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//  
//

import UIKit

protocol DialogRemoveViewProtocol: BaseViewProtocol {
    
    var onCompletion: CompletionBlock? { get set }
    
}