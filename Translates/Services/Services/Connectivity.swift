//
//  Connectivity.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Foundation
import Alamofire

// swiftlint:disable convenience_type
class Connectivity {
    class func isConnectedToInternet() -> Bool {
        NetworkReachabilityManager()?.isReachable ?? false
    }
}
