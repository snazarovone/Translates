//
//  APIWrapperAPIMain.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Foundation
import UIKit

class APIWrapperAPIMain {
    
    private let apiService: APIServiceProtocolAPIMain
    
    var isReachable: Bool {
        apiService.isReachable
    }
    
    init (
        apiService: APIServiceProtocolAPIMain = APIServiceAPIMain()
    ) {
        self.apiService = apiService
    }
    
    /// You can search in English or translation.
    func searchWord(with request: SearchRequest,
                    completion: @escaping (Result<APIEmptyData, Error>) -> Void) {
        apiService.performSearchWordRequest(request, completion: completion)
    }
}
