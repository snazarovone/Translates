//
//  WordTableViewCell.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//
import UIKit

class WordTableViewCell: UITableViewCell, Configurable {

    @IBOutlet private weak var wordLbl: UILabel!
    @IBOutlet private weak var logoImg: UIImageView!
    @IBOutlet private weak var addWordBtn: ActionButton!
    
    var model: WordCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
        initListener()
    }
    
    func initUI() {
        wordLbl.font = .systemFont(ofSize: 15, weight: .semibold)
        wordLbl.textColor = .tBlack
        wordLbl.numberOfLines = 2
        
        logoImg.backgroundColor = .tGrey
        logoImg.layer.cornerRadius = 8
        logoImg.contentMode = .scaleAspectFill
        logoImg.clipsToBounds = true
    }
    
    func configure(with model: WordCellModel) {
        self.model = model
        wordLbl.text = model.translate
        
        DownloadImgManager.setImage(
            with: URL(
                string: "https:\(model.urlImg ?? "")"
            ),
            imageView: logoImg
        )
        addWordBtn.isHidden = !model.add
    }
    
    func initListener() {
        addWordBtn.touchUp = { [weak self] _ in
            self?.model?.addToDictionary()
        }
    }
}
