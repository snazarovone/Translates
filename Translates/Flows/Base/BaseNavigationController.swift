//
//  BaseNavigationController.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit
import SnapKit

class BaseNavigationController: UINavigationController {
    
    var navigationTitleView: NavigationTitleView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isTranslucent = true
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.installBlurEffect()
        
        self.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 17, weight: .bold),
            .foregroundColor: UIColor.tBlack
        ]
        
        self.delegate = self
        self.interactivePopGestureRecognizer?.delegate = nil
        self.interactivePopGestureRecognizer?.isEnabled = self.responds(
            to: #selector(getter: interactivePopGestureRecognizer)
        ) && self.viewControllers.count > 1

    }
 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
}

extension BaseNavigationController {

    func navigationTitleViewModel(isShow: Bool) {
        for view in self.navigationBar.subviews.filter({ $0 is NavigationTitleView }) {
            UIView.animate(withDuration: 0.15) {
                view.alpha = isShow ? 1.0 : 0.0
            }
        }
    }
    
    func addNavigationTitleView() {
        let navigationTitleView = NavigationTitleView()
        
        if navigationBar.subviews.contains(where: { $0 is NavigationTitleView }) {
            return
        }
        
        self.navigationTitleView = navigationTitleView
        
        navigationBar.addSubview(navigationTitleView)
        
        navigationTitleView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.navigationBar)
            make.centerX.equalToSuperview()
        }
    }
    
}

extension BaseNavigationController: UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        self.interactivePopGestureRecognizer?.isEnabled = self.responds(
            to: #selector(getter: interactivePopGestureRecognizer)
        ) && self.viewControllers.count > 1
    }
    
}
