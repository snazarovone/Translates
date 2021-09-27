//
//  MeaningsRequest.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//

import Foundation

struct MeaningsRequest {
    var ids: String
}

extension MeaningsRequest {
    var queryParameters: [String: Any] {
        let params: [String: Any] = [
            "ids": ids
        ]
        return params
    }
}

