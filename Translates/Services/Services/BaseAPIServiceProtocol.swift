//
//  BaseAPIServiceProtocol.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Foundation
import Moya

protocol BaseAPIServiceProtocol {
    func createInnerCompletionBlock<T: Decodable>(
        from outerBlock: ((Swift.Result<T, Error>) -> Void)?
    ) -> Completion
}
