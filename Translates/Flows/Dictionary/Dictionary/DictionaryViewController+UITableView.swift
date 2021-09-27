//
//  ProfileViewController+UITableView.swift
//  LPAY
//
//  Created by Sergey Nazarov on 05.02.2021.
//

import UIKit

extension DictionaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        dataSource?.tableView(tableView, viewForHeaderInSection: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        .zero
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = dataSource?.sections[indexPath.section].items[indexPath.row]
                as? WordCellModel else {
            return
        }
        presenter?.didSelectWord(with: model.meaning, searchWord: model.searchWord)
    }
}
