//
//  UISearchBar+Extension.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//

import UIKit

extension UISearchBar {
    func bacgroundTextFiled(with color: UIColor) {
        if let textfield = getTextFiled() {
            textfield.backgroundColor = color
        }
    }
    
    func getTextFiled() -> UITextField? {
        if let textfield = self.value(forKey: "searchField") as? UITextField {
            return textfield
        }
        
        return nil
    }
}
