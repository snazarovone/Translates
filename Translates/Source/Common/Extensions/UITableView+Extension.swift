//
//  UITableView+Extension.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
    }
    
    // MARK: - Inicator Footer
    func indicatorView() -> UIActivityIndicatorView {
        var activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.color = .tBlack
        if self.tableFooterView == nil {
            let indicatorFrame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 40)
            activityIndicatorView = UIActivityIndicatorView(frame: indicatorFrame)
            activityIndicatorView.color = .tBlack
            activityIndicatorView.isHidden = false
            activityIndicatorView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
            activityIndicatorView.isHidden = true
            self.tableFooterView = activityIndicatorView
            return activityIndicatorView
        } else {
            return activityIndicatorView
        }
    }

    func startLoading() {
        DispatchQueue.main.async {
            self.indicatorView().startAnimating()
        }
    }

    func stopLoading() {
        DispatchQueue.main.async {
            self.indicatorView().stopAnimating()
            self.indicatorView().isHidden = true
            self.tableFooterView = nil
            self.refreshControl?.endRefreshing()
        }
    }
}

