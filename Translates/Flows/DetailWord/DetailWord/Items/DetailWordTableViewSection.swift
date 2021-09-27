//
//  DetailWordTableViewSection.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import Foundation

class DetailWordTableViewSection: TableViewSection {
    
    var collapsed: Bool = false
    var headerItem: TableViewSectionHeaderCompatible?
    var items: [TableViewCompatible]
    
    init(
        headerItem: TableViewSectionHeaderCompatible,
        items: [TableViewCompatible]
    ) {
        self.headerItem = headerItem
        self.items = items
    }
    
    init(items: [TableViewCompatible]) {
        self.items = items
    }
    
}

