//
//  MeaningsModel.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//

import Foundation

struct MeaningsModel: Decodable {
    let id: Int
    let partOfSpeechCode: String
    let translation: TranslationModel?
    let previewUrl: String?
    let imageUrl: String?
    let transcription: String?
    let soundUrl: String
}
