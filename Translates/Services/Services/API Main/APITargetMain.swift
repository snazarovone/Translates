//
//  APITargetMain.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Moya
import Alamofire

enum APITargetMain {
    
    case search(request: SearchRequest)
}

extension APITargetMain: TargetType {
    
    var baseURL: URL {
        AppTarget.current().url
    }
    
    var path: String {
        let ver = AppTarget.current().ver
        switch self {
        case .search:
            return "api/public/\(ver)/words/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    var headers: [String: String]? {
        headersDefault
    }
    
    var task: Task {
        switch self {
        case .search:
            return .requestParameters(parameters: requestParameters, encoding: URLEncoding.queryString)
        }
    }
    
    var requestParameters: [String: Any] {
        switch self {
        case .search(let request): return request.queryParameters
        }
    }
    
    var sampleData: Data {
        Data()
    }
}

