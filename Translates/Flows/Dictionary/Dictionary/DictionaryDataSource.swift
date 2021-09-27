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
    
    func prepareData(with data: [MeaningsModel]) {
        
        sections = [
            DictionaryTableViewSection(
                items: data.map({
                    WordCellModel(
                        with: $0,
                        searchWord: nil,
                        is: false,
                        delegate: nil
                    )
                })
            )
        ]
        
        tableView.reloadData()
    }
    
    private func registerCell() {
        tableView.register(nibWithCellClass: WordTableViewCell.self)
    }
    
}

