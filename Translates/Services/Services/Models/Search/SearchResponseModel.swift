//
//  SearchResponseModel.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//

import Foundation

struct SearchResponseModel: Codable {
    let id: Int
    let text: String?
    let meanings: [MeaningsModel]
}
