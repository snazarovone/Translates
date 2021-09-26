//
//  TableViewCompatible.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import Foundation
import UIKit

// swiftlint:disable line_length
/**
 Let your model object conform to this protocol to make it compatible with a `UITableView`
 */
public protocol TableViewCompatible: CollectionAndTableViewCompatible {
    
    /// Call this from your `UITableViewDataSource` and return a fully configured `UITableViewCell`. If your cells conforms to the `Configurable` protocol, you can call `configureWithModel(_: T)` with `self` as parameter in your implementation.
    /// parameter tableView: a table view requesting the cell.
    /// parameter indexPath: an index path locating the row in the table view.
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell

}
