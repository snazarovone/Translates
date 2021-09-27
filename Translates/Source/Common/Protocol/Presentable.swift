//
//  Presentable.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol Presentable {
    
    var toPresent: UIViewController? { get }
    
}

extension UIViewController: Presentable {
    
    var toPresent: UIViewController? {
        self
    }
}
