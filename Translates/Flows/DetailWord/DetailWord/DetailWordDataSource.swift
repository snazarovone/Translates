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
    
    func prepareData(word: String,
                     meaning: MeaningsModel,
                     model: MeaningsResponseModel?) {
        
        var items: [TableViewCompatible] = [
            TopDetailWordCellModel(with: meaning, searchWord: word)
        ]
        items.append(contentsOf: getInfoWord(model: model))
        
        sections = [
            DetailWordTableViewSection(
                items: items
            )
        ]
        
        tableView.reloadData()
    }
    
    private func getInfoWord(model: MeaningsResponseModel?) -> [TableViewCompatible] {
        var results = [TableViewCompatible]()
        guard let model = model else {
            return results
        }
        
        if let transcription = model.transcription {
            results.append(EmptyCellModel(with: 16))
            results.append(PlainTextCellModel(with: "[\(transcription)]"))
        }
        
        if let definition = model.definition?.text {
            results.append(EmptyCellModel(with: 8))
            results.append(PlainTextCellModel(with: definition))
        }
        
        
        return results
    }
    
    private func registerCell() {
        tableView.register(nibWithCellClass: TopDetailWordTableViewCell.self)
        tableView.register(nibWithCellClass: EmptyTableViewCell.self)
        tableView.register(nibWithCellClass: PlainTextTableViewCell.self)
    }
    
}

