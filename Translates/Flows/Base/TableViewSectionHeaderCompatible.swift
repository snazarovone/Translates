//
//  TableViewSectionHeaderCompatible.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import Foundation
import UIKit

public protocol TableViewSectionHeaderCompatible {
    
    var reuseIdentifier: String { get }
    
    func headerForTableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    
}
