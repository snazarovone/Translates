//
//  NavigationTitleView.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit
import SnapKit

class NavigationTitleView: BaseView {
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .TranslatesBlack
        lbl.font = .systemFont(ofSize: 17, weight: .bold)
        lbl.textAlignment = .center
        return lbl
    }()
    private let subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .TranslatesGrey
        lbl.font = .systemFont(ofSize: 11, weight: .regular)
        lbl.textAlignment = .center
        return lbl
    }()

    init() {
        super.init(frame: CGRect.zero)
    }
    
    override func initUI() {
        addSubviews(titleLabel, subtitleLabel)
    }
    
    override func initConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(subtitleLabel.snp.top).priority(.medium)
            make.height.equalTo(subtitleLabel.snp.height)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-4)
        }
    }
}
