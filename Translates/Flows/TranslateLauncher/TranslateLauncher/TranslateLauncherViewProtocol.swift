//
//  TranslateLauncherViewProtocol.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol TranslateLauncherViewProtocol: BaseViewProtocol {
    
    var onCompletion: CompletionBlock? { get set }
}
