//
//  SearchResponseModel.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//

import Foundation

struct SearchResponseModel: Decodable {
    let id: Int
    let text: String?
    let meanings: [MeaningsModel]
}
