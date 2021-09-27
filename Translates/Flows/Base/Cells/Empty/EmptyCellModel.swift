//
//  EmptyCellModel.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

class EmptyCellModel: TableViewCompatible {
    
    let height: CGFloat
    
    init(with height: CGFloat) {
        self.height = height
    }

    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: self.reuseIdentifier,
            for: indexPath
        ) as? EmptyTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: self)
        return cell
    }
    
    var reuseIdentifier: String {
        String(describing: EmptyTableViewCell.self)
    }
    
    var selected = false
}
