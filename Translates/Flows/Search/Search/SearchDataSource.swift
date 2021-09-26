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
        
        sections = data.enumerated().map({
            SearchTableViewSection(
                headerItem: WordsHeaderViewModel(
                    with: $0.element,
                    isCollapsed: true,
                    index: $0.offset,
                    delegate: self
                ),
                items: $0.element.meanings.map({
                    WordCellModel(with: $0)
                }),
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
        
        tableView.register(nibWithCellClass: WordTableViewCell.self)
    }
}

extension SearchDataSource: WordsHeaderDeleagte {
    func didCollapsed(by index: Int) {
        sections[index].collapsed = !sections[index].collapsed
        (sections[index].headerItem as? WordsHeaderViewModel)?.isCollapsed =
            sections[index].collapsed
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            if !self.sections[index].items.isEmpty,
               self.sections[index].collapsed == false {
                self.tableView.scrollToRow(
                    at: IndexPath(item: 0, section: index),
                    at: .top, animated: true
                )
            }
        }
    }
}

