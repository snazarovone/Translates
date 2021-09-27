//
//  DictionaryTableViewSection.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//  
//

import Foundation

class DictionaryTableViewSection: TableViewSection {
    
    var collapsed = false
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

