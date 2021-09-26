//
//  SearchTableViewSection.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import Foundation

class SearchTableViewSection: TableViewSection {
    
    var headerItem: TableViewSectionHeaderCompatible?
    var items: [TableViewCompatible]
    
    /// Признак свернута ли секция
    var collapsed: Bool
    
    init(
        headerItem: TableViewSectionHeaderCompatible,
        items: [TableViewCompatible],
        collapsed: Bool
    ) {
        self.headerItem = headerItem
        self.items = items
        self.collapsed = collapsed
    }
    
}

