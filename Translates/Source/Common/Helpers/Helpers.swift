//
//  Helpers.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//

import UIKit

enum Helper {
    
    static var safeAreaInsets: UIEdgeInsets {
        UIApplication.shared.keyWindow?.rootViewController?.view.safeAreaInsets ?? .zero
    }
    
}
