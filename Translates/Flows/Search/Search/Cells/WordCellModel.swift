//
//  WordCellModel.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

class WordCellModel: TableViewCompatible {
    
    let meaning: MeaningsModel
    let searchWord: String?
    
    init(with meaning: MeaningsModel,
         searchWord: String?) {
        self.meaning = meaning
        self.searchWord = searchWord
    }
    
    /// Перевод
    var translate: String? {
        meaning.translation?.text
    }
    
    /// Ссылка на картинку
    var urlImg: String? {
        meaning.previewUrl
    }

    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: self.reuseIdentifier,
            for: indexPath
        ) as? WordTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: self)
        return cell
    }
    
    var reuseIdentifier: String {
        String(describing: WordTableViewCell.self)
    }
    
    var selected = false
}
