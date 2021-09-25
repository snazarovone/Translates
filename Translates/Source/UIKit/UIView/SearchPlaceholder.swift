//
//  SearchPlaceholder.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//

import UIKit

class SearchPlaceholder: BaseView {
    
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .tGrey
        lbl.text = "search_and_add_pl".localized
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let logoImg: UIImageView = {
        let img = UIImageView(image: UIImage(named: "wing"))
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override func initUI() {
        addSubviews(titleLbl, logoImg)
    }
    
    override func initConstraints() {
        titleLbl.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        logoImg.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(16)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
        }
    }
}


