//
//  TableViewSection.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

public protocol TableViewSection {
    
    var headerItem: TableViewSectionHeaderCompatible? { get set }
    var items: [TableViewCompatible] { get set }
    var collapsed: Bool { get set }
}
