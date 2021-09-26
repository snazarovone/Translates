//
//  DictionaryDataSource.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//  
//

import UIKit

class DictionaryDataSource: TableViewDataSource {
    
    override init(tableView: UITableView) {
        super.init(tableView: tableView)
        
        registerCell()
    }
    
    func prepareData() {
        
        sections = [DictionaryTableViewSection]()
        
        tableView.reloadData()
    }
    
    private func registerCell() {
//        tableView.register(nibWithCellClass: LabelTableViewCell.self)
    }
    
}

