//
//  BaseView.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        initUI()
        initConstraints()
        initListeners()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
}
