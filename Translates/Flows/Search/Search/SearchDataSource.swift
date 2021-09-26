//
//  SearchDataSource.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

class SearchDataSource: TableViewDataSource {
    
    private let sectionHeaderWordNibName = String(describing: WordsHeaderView.self)
    
    override init(tableView: UITableView) {
        super.init(tableView: tableView)
        
        registerCell()
    }
    
    func prepareData(with data: [SearchResponseModel]) {
        
        sections = data.map({
            SearchTableViewSection(
                headerItem: WordsHeaderViewModel(with: $0),
                items: [],
                collapsed: true
            )
        })
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func registerCell() {
      
        tableView.register(
            UINib(nibName: sectionHeaderWordNibName, bundle: Bundle.main),
            forHeaderFooterViewReuseIdentifier: sectionHeaderWordNibName
        )
        
//        tableView.register(nibWithCellClass: LabelTableViewCell.self)
    }
    
}

