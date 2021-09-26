//
//  TopDetailWordTableViewCell.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//
import UIKit

class TopDetailWordTableViewCell: UITableViewCell, Configurable {

    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var pictureImg: UIImageView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var wordLbl: UILabel!
    @IBOutlet private weak var translateLbl: UILabel!
    
    var model: TopDetailWordCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }
    
    func initUI() {
        mainView.layer.cornerRadius = 12
        pictureImg.contentMode = .scaleAspectFill
        bottomView.backgroundColor = .tBlue
      
        wordLbl.font = .systemFont(ofSize: 18, weight: .semibold)
        translateLbl.font = .systemFont(ofSize: 16, weight: .regular)
        [translateLbl, wordLbl].forEach({
            $0?.textColor = .tWhite
        })
    }
    
    func configure(with model: TopDetailWordCellModel) {
        self.model = model
        
        wordLbl.text = model.searchWord
        translateLbl.text = model.translate
    
        DownloadImgManager.setImage(
            with: URL(
                string: "https:\(model.urlImg ?? "")"
            ),
            imageView: pictureImg
        )
    }
}
