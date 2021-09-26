//
//  WordsHeaderViewModel.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

class WordsHeaderViewModel: TableViewSectionHeaderCompatible {
    
    var reuseIdentifier: String {
        String(describing: WordsHeaderView.self)
    }
    
    let model: SearchResponseModel
    
    var searchWord: String? {
        model.text
    }
    
    var translates: String? {
        var result: String = ""
        
        model.meanings.forEach({
            if let text = $0.translation?.text {
                result += "\(text), "
            }
        })
        
        result = result.trimmingCharacters(in: CharacterSet(charactersIn: ", "))
        return result
    }
    
    /// Колличество слов
    var countMeanings: Int {
        model.meanings.count
    }
    
    /// Ссылка на картинку
    var urlImg: String? {
        model.meanings.count > 1
            ? nil
            : model.meanings.first?.previewUrl
    }
    
    init(with model: SearchResponseModel) {
        self.model = model
    }
    
    // swiftlint:disable line_length
    func headerForTableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? WordsHeaderView else {
            return nil
        }
        view.configure(with: self)
        return view
    }
}
