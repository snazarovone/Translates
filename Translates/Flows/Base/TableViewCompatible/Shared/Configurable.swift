//
//  Configurable.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import Foundation

// swiftlint:disable all
/**
 Let your `UICollectionViewCell` or `UITableViewCell` conform to this protocol.
 */
public protocol Configurable {
    
    associatedtype T
    var model: T? { get set }
    func configure(with model: T)
    
}
