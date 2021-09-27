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
    case yes(title: String)
    case cancel(title: String)
}

extension StyleButton {
    var backgroundColor: UIColor {
        switch self {
        case .add:
            return .tGreen
        case .remove:
            return .tRed
        case .yes:
            return .lightGray
        case .cancel:
            return .gray
        }
    }
}
