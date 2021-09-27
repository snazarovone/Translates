//
//  PlainTextTableViewCell.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//
import UIKit

class PlainTextTableViewCell: UITableViewCell, Configurable {

    @IBOutlet private weak var titleLbl: UILabel!
    
    var model: PlainTextCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }
    
    func initUI() {
        titleLbl.font = .systemFont(ofSize: 15)
        titleLbl.textColor = .tBlack
        titleLbl.numberOfLines = 0
    }
    
    func configure(with model: PlainTextCellModel) {
        self.model = model
        titleLbl.text = model.text
    }
}
