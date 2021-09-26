//
//  TableViewDataSource.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

open class TableViewDataSource: NSObject, TableViewData, UITableViewDataSource {

    public let tableView: UITableView
    open var sections: [TableViewSection] = []
    
    public init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.dataSource = self
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowsInSection(section: section)
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellForTableView(tableView: tableView, atIndexPath: indexPath)
    }
    
    // Optional
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        numberOfSections()
    }
    
    open func insertItem(atIndexPath indexPath: IndexPath) {
        // Override in subclass if needed
    }
    
    open func deleteItem(atIndexPath indexPath: IndexPath) {
        self.sections[indexPath.section].items.remove(at: indexPath.row)
    }
    
}

extension TableViewDataSource: UITableViewDelegate {
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sections[section].headerItem?.headerForTableView(tableView: tableView, viewForHeaderInSection: section)
    }
    
}
