//
//  MockTableViewSearch.swift
//  TranslatesTests
//
//  Created by Sergey Nazarov on 27.09.2021.
//

import UIKit
@testable import Translates

extension SearchViewController {
    class MockTableViewSearch: UITableView {
        var cellIsDequeued = false
        
        override func dequeueReusableCell(
            withIdentifier identifier: String,
            for indexPath: IndexPath
        ) -> UITableViewCell {
            cellIsDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockApplicationCloseTableViewCell: WordTableViewCell {
        
        var viewModel: WordCellModel?
        
        override func configure(with model: WordCellModel) {
            self.viewModel = model
        }
    }
}
