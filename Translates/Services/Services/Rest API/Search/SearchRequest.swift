//
//  SearchRequest.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//

import Foundation

struct SearchRequest {
    var search: String
    var page: Int = 1
    var pageSize: Int = 20
}

extension SearchRequest {
    var queryParameters: [String: Any] {
        let params: [String: Any] = [
            "search": search,
            "page": page,
            "pageSize": pageSize
        ]
        return params
    }
}

