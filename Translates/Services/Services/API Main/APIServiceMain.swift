//
//  APIServiceMain.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Moya
import Alamofire

class APIServiceMain: BaseAPIService, APIServiceProtocolMain {

    private let provider: MoyaProvider<APITargetMain> = {
        let session = Session(interceptor: BaseRequestRetrier())
        session.sessionConfiguration.timeoutIntervalForRequest = 1
        session.sessionConfiguration.timeoutIntervalForResource = 10
        
        var plugins = [NetworkLoggerPlugin]()
        #if DEBUG
            plugins.append(NetworkLoggerPlugin(configuration: .init(logOptions: .formatRequestAscURL)))
        #endif

        return MoyaProvider<APITargetMain>(
            session: session,
            plugins: plugins
        )
    }()
    
    var isReachable: Bool {
        NetworkReachabilityManager()?.isReachable ?? false
    }
    
    /// You can search in English or translation.
    func performSearchWordRequest(
        _ request: SearchRequest,
        completion: ((Result<SearchResponseData, Error>) -> Void)?) {
        
        provider.session.cancelAllRequests(
            completingOnQueue: .main) { [unowned self] in
            self.provider.request(
                .search(request: request),
                completion: self.createInnerCompletionBlock(from: completion)
            )
        }
    }
    
    /// Return full information about meaning
    func performMeaningsRequest(
        _ request: MeaningsRequest,
        completion: ((Result<MeaningsResponseData, Error>) -> Void)?) {
        provider.request(
            .meanings(request: request),
            completion: createInnerCompletionBlock(from: completion)
        )
    }
}
