//
//  String+Extension.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Foundation

// var

extension String {

    var localized: String {
        guard let languageArray = UserDefaults.standard.value(forKey: "AppleLanguages") as? [String],
            let language = languageArray.first,
            let path = Bundle.main.path(forResource: language, ofType: "lproj"),
            let bundle = Bundle(path: path) else {
                
                return NSLocalizedString(self, comment: "")
        }
        
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
    
    // swiftlint:disable identifier_name
    var stringByRemovingWhitespaceAndNewlineCharacterSet: String {
        self.components(separatedBy: CharacterSet.whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: "")
    }
    
    var isBlank: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

// func

extension String {
    
    func capitalizingFirstLetter() -> String {
        prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func removeWhitespaces() -> String {
        components(separatedBy: .whitespaces).joined()
    }
    
    func numberOnly() -> String {
        replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression, range: nil)
    }
    
    func decimalOnly() -> String {
        replacingOccurrences(of: "[^0-9,.]", with: "", options: .regularExpression, range: nil)
    }

}

// MARK: - optional

extension Optional where Wrapped == String {
    
    var isEmpty: Bool {
        self?.isEmpty ?? true
    }
    
    var isNotEmpty: Bool {
        !isEmpty
    }
    
    var isBlank: Bool {
        self?.isBlank ?? true
    }
    
    var isNotBlank: Bool {
        !isBlank
    }
}
