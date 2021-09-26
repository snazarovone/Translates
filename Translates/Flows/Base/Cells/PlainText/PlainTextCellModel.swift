//
//  PlainTextCellModel.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

class PlainTextCellModel: TableViewCompatible {
    
    let text: String
    
    init(with text: String) {
        self.text = text
    }

    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: self.reuseIdentifier,
            for: indexPath
        ) as? PlainTextTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: self)
        return cell
    }
    
    var reuseIdentifier: String {
        String(describing: PlainTextTableViewCell.self)
    }
    
    var selected = false
}
