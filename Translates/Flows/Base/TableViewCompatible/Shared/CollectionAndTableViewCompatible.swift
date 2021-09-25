//
//  CollectionAndTableViewCompatible.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import Foundation

public protocol CollectionAndTableViewCompatible {
    
    var reuseIdentifier: String { get }
    
    var selected: Bool { get set }
    var editable: Bool { get }
    var movable: Bool { get }
    
    func prefetch()
    func cancelPrefetch()

}

// Default implementations
public extension CollectionAndTableViewCompatible {
    
    var editable: Bool {
        false
    }
    
    var movable: Bool {
        false
    }
    
    func prefetch() { }
    func cancelPrefetch() { }
    
}
