//
//  RootCoordinatorOutput.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol RootCoordinatorOutput: AnyObject {
    
    var rootViewController: UIViewController? { get }
    var finishFlow: CompletionBlock? { get set }
    
}
