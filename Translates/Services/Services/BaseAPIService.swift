//
//  BaseAPIService.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Foundation
import Moya
import Alamofire

// MARK: Mapping and error extraction

class BaseAPIService: BaseAPIServiceProtocol {
    func createInnerCompletionBlock<T: Decodable>(
        from outerBlock: ((Swift.Result<T, Error>) -> Void)?
    ) -> Completion {
        { [weak self] result in
            guard let self = self else {
                return
            }
            
            let convertedResult: Swift.Result<Response, MoyaError> = {
                switch result {
                case .success(let response): return .success(response)
                case .failure(let error):
                    return .failure(error)
                }
            }()
            
            outerBlock?(self.mapRequestResult(convertedResult))
        }
    }
    
    private func mapRequestResult<T: Decodable>(
        _ result: Swift.Result<Response, MoyaError>
    ) -> Swift.Result<T, Error> {
        switch result {
        case .success(let response): return mapResponse(response)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    private func mapResponse<T: Decodable>(_ response: Response) -> Swift.Result<T, Error> {
        
        do {
            let mappedErrorResponse = try response.map(APIErrorResponse.self)
            
            if let error = mappedErrorResponse.error {
                let errorUserInfo = [NSLocalizedDescriptionKey: error.message ?? ""]
                let error = NSError(
                    domain: "RestAPIServiceError",
                    code: response.statusCode,
                    userInfo: errorUserInfo
                )
                print(error)
                return .failure(error)
            }
            
            guard  response.statusCode >= 200 && response.statusCode <= 300 else {
                let error = NSError(
                    domain: "RestAPIServiceError",
                    code: response.statusCode,
                    userInfo: [:]
                )
                print(error)
                return .failure(error)
            }
            
            let mappedResponse = try response.map(T.self)
            
            return .success(mappedResponse)
                        
        } catch let moyaError as MoyaError {
            let errorUserInfo = [NSLocalizedDescriptionKey: "Ошибка маппинга данных\n\(moyaError)"]
            let error = NSError(
                domain: "RestAPIServiceError",
                code: 2002,
                userInfo: errorUserInfo
            )
            print(error)
            return .failure(error)
        } catch {
            let errorUserInfo = [NSLocalizedDescriptionKey: "Ошибка маппинга данных"]
            let error = NSError(
                domain: "RestAPIServiceError",
                code: 2002,
                userInfo: errorUserInfo
            )
            print(error)
            return .failure(error)
        }
        
    }
    
    private func extractErrorMessage(from response: APIErrorResponse) -> String {
        ""
    }

}
