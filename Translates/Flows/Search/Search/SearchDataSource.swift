//
//  SearchDataSource.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

class SearchDataSource: TableViewDataSource {
    
    var addWordToDictionary: ((MeaningsModel) -> Void)?
    
    private let sectionHeaderWordNibName = String(describing: WordsHeaderView.self)
    
    private var currentOpenSection: Int?
    
    override init(tableView: UITableView) {
        super.init(tableView: tableView)
        
        registerCell()
    }
    
    func prepareData(with data: [SearchResponseModel],
                     my words: [MeaningsModel]) {
        
        sections = data.enumerated().map({
            let word = $0.element.text
            return SearchTableViewSection(
                    headerItem: WordsHeaderViewModel(
                    with: $0.element,
                        isCollapsed: !((currentOpenSection ?? -1) == $0.offset),
                    index: $0.offset,
                    delegate: self
                ),
                items: $0.element.meanings.map({
                    WordCellModel(
                        with: $0,
                        searchWord: word,
                        is: !wordIsExistDict(by: $0.id, my: words),
                        delegate: self
                    )
                }),
                collapsed: !((currentOpenSection ?? -1) == $0.offset)
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
    
    private func wordIsExistDict(by wordId: Int,
                                 my words: [MeaningsModel]) -> Bool {
        words.first(where: { $0.id == wordId }) != nil
    }
}

extension SearchDataSource: WordsHeaderDeleagte,
                            WordCellDelegate {
    func didCollapsed(by index: Int) {
        
        if let currentOpenSection = currentOpenSection,
           currentOpenSection < sections.count,
           index != currentOpenSection {
            sections[currentOpenSection].collapsed = true
            (sections[currentOpenSection].headerItem as? WordsHeaderViewModel)?.isCollapsed = true
        }

        sections[index].collapsed = !sections[index].collapsed
        (sections[index].headerItem as? WordsHeaderViewModel)?.isCollapsed =
            sections[index].collapsed
        
        currentOpenSection = index
        
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
    
    func addToDictionary(with model: MeaningsModel) {
        addWordToDictionary?(model)
    }
}

