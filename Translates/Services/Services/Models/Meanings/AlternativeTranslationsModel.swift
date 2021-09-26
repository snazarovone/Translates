//
//  AlternativeTranslationsModel.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//

import Foundation

struct AlternativeTranslationsModel: Decodable {
    let text: String?
    let translation: TranslationModel?
}
