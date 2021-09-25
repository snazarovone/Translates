//
//  BaseRequestInterceptor.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Alamofire

class BaseRequestRetrier: RequestInterceptor {
    func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        completion(.success(urlRequest))
    }
    
    func retry(
        _ request: Request,
        for session: Session,
        dueTo error: Error,
        completion: @escaping (RetryResult) -> Void
    ) {
        // If task failed 5 attempts to finish, everything is very bad (connection is dead). TODO: Add Reachability
        guard request.retryCount < 5 else {
            print("REQUEST RETRIER: Task failed to finish in 5 attempts. RIP")
            return completion(.doNotRetry)
        }
        
        // If task was not completed at all (probably because of unstable connection), try it again.
        guard let response = request.task?.response as? HTTPURLResponse else {
            print("REQUEST RETRIER: Task returned no response. Trying again. Attempt #\(request.retryCount + 1)")
            return completion(.retryWithDelay(Double(request.retryCount) * 2.0))
        }
        
        if response.statusCode == 401 {
            completion(.retryWithDelay(1.0)) // retry after 1 second
        } else {
            completion(.doNotRetry) // don't retry
        }
    }
    
}

