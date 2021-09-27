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
    case meanings(request: MeaningsRequest)
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
        case .meanings:
            return "api/public/\(ver)/meanings"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search, .meanings:
            return .get
        }
    }
    
    var headers: [String: String]? {
        headersDefault
    }
    
    var task: Task {
        switch self {
        case .search, .meanings:
            return .requestParameters(parameters: requestParameters, encoding: URLEncoding.queryString)
        }
    }
    
    var requestParameters: [String: Any] {
        switch self {
        case .search(let request): return request.queryParameters
        case .meanings(let request): return request.queryParameters
        }
    }
    
    var sampleData: Data {
        Data()
    }
}

