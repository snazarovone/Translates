//
//  MeaningsResponseModel.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//

import Foundation

struct MeaningsResponseModel: Decodable {
    let id: String
    let wordId: Int?
    let text: String
    let soundUrl: String?
    let transcription: String?
    let translation: TranslationModel?
    let definition: DefinitionModel?
    let examples: [ExamplesModel]
    let alternativeTranslations: [AlternativeTranslationsModel]
}
