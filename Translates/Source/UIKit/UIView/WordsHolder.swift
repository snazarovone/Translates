//
//  WordsHolder.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//

import UIKit

class WordsHolder: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        initConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
        initConstraints()
    }
    

    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .tGrey
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.tWhite.cgColor
        return view
    }()
    
    private let marginView: UIView = {
        let view = UIView()
        view.backgroundColor = .tGrey
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let countWordsLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18, weight: .medium)
        lbl.textColor = .tWhite
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let img: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 8
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    private func initUI() {
        addSubviews(marginView, mainView, img)
        mainView.addSubviews(countWordsLbl)
    }
    
    private func initConstraints() {
        mainView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-4)
            make.right.equalToSuperview().offset(-4)
        }
        marginView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.bottom.right.equalToSuperview()
            make.left.equalToSuperview().offset(4)
        }
        countWordsLbl.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.left.equalToSuperview()
        }
        img.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setCountTitle(with count: Int, imgUrl: String?) {
        img.isHidden = count > 1
        countWordsLbl.text = "\(count)"
        
        if let imgUrl = imgUrl {
            DownloadImgManager.setImage(
                with: URL(
                    string: "http://\(imgUrl.trimmingCharacters(in: CharacterSet(charactersIn: "//")))"
                ),
                imageView: img
            )
        } else {
            img.image = nil
        }
    }
}
