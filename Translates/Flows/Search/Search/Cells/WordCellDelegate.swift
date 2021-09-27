//
//  WordCellDelegate.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//

import Foundation

protocol WordCellDelegate: AnyObject {
    func addToDictionary(with model: MeaningsModel)
}
