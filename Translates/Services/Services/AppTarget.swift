//
//  AppTarget.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//

import Foundation

enum AppTarget {
    case production
    case stage
    
    static func current() -> AppTarget {
        switch Bundle.main.infoDictionary?["TargetName"] as? String {
        case "Translates":
            return .production
        default:
            fatalError("Target Name not found")
        }
    }
    
    var url: URL {
        switch self {
        case .production:
            return URL(string: "https://dictionary.skyeng.ru/")!
        default:
            fatalError("Target Name not found")
        }
    }
    
    var ver: String {
        switch self {
        case .production:
            return "v1"
        default:
            fatalError("Target Name not found")
        }
    }
}
