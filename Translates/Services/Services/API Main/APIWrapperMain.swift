//
//  APIWrapperMain.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Foundation
import UIKit

class APIWrapperMain {
    
    private let apiService: APIServiceProtocolMain
    
    var isReachable: Bool {
        apiService.isReachable
    }
    
    init (
        apiService: APIServiceProtocolMain = APIServiceMain()
    ) {
        self.apiService = apiService
    }
    
    /// You can search in English or translation.
    func searchWord(with request: SearchRequest,
                    completion: @escaping (Result<SearchResponseData, Error>) -> Void) {
        apiService.performSearchWordRequest(request, completion: completion)
    }
}
