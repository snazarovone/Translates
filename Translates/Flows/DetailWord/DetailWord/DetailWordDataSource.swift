//
//  DetailWordDataSource.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

class DetailWordDataSource: TableViewDataSource {
    
    override init(tableView: UITableView) {
        super.init(tableView: tableView)
        
        registerCell()
    }
    
    func prepareData(word: String, meaning: MeaningsModel) {
        
        sections = [
            DetailWordTableViewSection(
                items: [
                    TopDetailWordCellModel(with: meaning, searchWord: word)
                ]
            )
        ]
        
        tableView.reloadData()
    }
    
    private func registerCell() {
        tableView.register(nibWithCellClass: TopDetailWordTableViewCell.self)
    }
    
}

