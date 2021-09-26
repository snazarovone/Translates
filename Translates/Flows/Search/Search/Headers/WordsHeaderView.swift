//
//  WordsHeaderView.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

class WordsHeaderView: UITableViewHeaderFooterView {

    @IBOutlet private weak var wordsHeaders: WordsHolder!
    @IBOutlet private weak var topWordLbl: UILabel!
    @IBOutlet private weak var bottomWordLbl: UILabel!
    
    private var model: WordsHeaderViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clipsToBounds = true
        
        let backgroundView = UIView(frame: bounds)
        backgroundView.backgroundColor = UIColor.tWhite
        self.backgroundView = backgroundView
        
        initUI()
    }
    
    func initUI() {
        topWordLbl.font = .systemFont(ofSize: 15, weight: .semibold)
        topWordLbl.textColor = .tBlack
        
        bottomWordLbl.font = .systemFont(ofSize: 12, weight: .semibold)
        bottomWordLbl.textColor = .tGrey
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(handleTap(sender:))
        )
        self.addGestureRecognizer(tapGesture)
    }
    
    func configure(with model: WordsHeaderViewModel) {
        self.model = model
        topWordLbl.text = model.searchWord
        bottomWordLbl.text = model.translates
       
        wordsHeaders.setCountTitle(
            with: model.countMeanings,
            imgUrl: model.urlImg
        )
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        model?.didCollapsed()
    }
}
