//
//  StyleButton.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//

import UIKit

enum StyleButton {
    case add(title: String)
    case remove(title: String)
}

extension StyleButton {
    var backgroundColor: UIColor {
        switch self {
        case .add:
            return .tGreen
        case .remove:
            return .tRed
        }
    }
}
