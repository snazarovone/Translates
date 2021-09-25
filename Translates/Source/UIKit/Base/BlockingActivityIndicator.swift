//
//  BlockingActivityIndicator.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

final class BlockingActivityIndicator: UIView {
    private let activityIndicator: NVActivityIndicatorView

    override init(frame: CGRect) {
        self.activityIndicator = NVActivityIndicatorView(
        frame: CGRect(
            origin: .zero,
            size: CGSize(width: 30, height: 30)
            )
        )
        
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: frame)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIWindow {
    func startAnimating() {
        guard !subviews.contains(where: { $0 is BlockingActivityIndicator }) else {
            return
        }
        let activityIndicator = BlockingActivityIndicator()
        activityIndicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        activityIndicator.frame = bounds
        
        UIView.transition(
            with: self,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: { self.addSubview(activityIndicator) }
        )
    }
    
    func stopAnimating() {
        subviews.compactMap({ $0 as? BlockingActivityIndicator }).forEach({ existingView in
            UIView.transition(
                with: self,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: { existingView.removeFromSuperview() }
            )
        })
    }
}
