//
//  BaseViewController.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

class BaseViewController: UIViewController {
    
    var navController: BaseNavigationController? {
        self.navigationController as? BaseNavigationController
    }
    
    private let separatorNavigation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 0
        view.layer.shadowOpacity = 0.3
        view.alpha = 1
        return view
    }()
    
    /**
     Показать или скрыть разделить navigation bar
     */
    var showSeparatorNavigation: Bool = false {
        willSet(isShow) {
            if isShow == true {
                addSeparatorNavigation()
                separatorNavigation.layer.zPosition = 100
                view.alpha = 1
            } else {
                view.alpha = 0
            }
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NVActivityIndicatorView.DEFAULT_TYPE = .circleStrokeSpin
        
        initUI()
        initConstraints()
        initListeners()
    }
    
    func initUI() {
    }
    
    func initConstraints() {
    }
    
    func initListeners() {
        
    }
    
    func startAnimating() {
        UIApplication.shared.keyWindow?.startAnimating()
    }
    
    func stopAnimating() {
        UIApplication.shared.keyWindow?.stopAnimating()
    }
    
    private func addSeparatorNavigation() {
        view.insertSubview(separatorNavigation, at: separatorNavigation.subviews.count)
        separatorNavigation.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((navController?.topbarHeight ?? 0) - 1)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    func showErrorDialog(
        title: String? = nil,
        message: String? = nil,
        onButton: CompletionBlock? = nil
    ) {
        Alert(
            title: title ?? "error".localized,
            message: message ?? "internet_error".localized
        )
        .addAction("ok".localized, style: .default) { _ in
            onButton?()
        }
        .show()
    }
    
    func showQuetionDialogQuetion(
        title: String,
        message: String,
        onYes: CompletionBlock?,
        onNo: CompletionBlock?) {
        Alert(
            title: title,
            message: message
        )
        .addAction("yes".localized, style: .default) { _ in
            onYes?()
        }
        .addAction("no".localized, style: .cancel) { _ in
            onNo?()
        }
        .show()
    }
}

extension BaseViewController {
    
    func onAnimating(isStart: Bool) {
        isStart ? startAnimating() : stopAnimating()
    }
    
}
