//
//  DisplayCycle.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

public protocol DisplayCycle {
    
    func willDisplay()
    
    func didEndDisplay()
    
}

@objc
extension UITableViewCell: DisplayCycle {

    public func willDisplay() { }
    
    public func didEndDisplay() { }
    
}

@objc
extension UICollectionViewCell: DisplayCycle {
    
    public func willDisplay() { }
    
    public func didEndDisplay() { }
    
}
