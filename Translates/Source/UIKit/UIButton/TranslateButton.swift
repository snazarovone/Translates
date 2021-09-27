//
//  TranslateButton.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//

import UIKit

class TranslateButton: ActionButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        self.setTitleColor(.tWhite, for: .normal)
        self.layer.cornerRadius = 12
    }
    
    func setStyle(with model: StyleButton) {
        self.backgroundColor = model.backgroundColor
        self.layer.cornerRadius = 12
        switch model {
        case .add(let title):
            self.setTitle(title, for: .normal)
        case .remove(let title):
            self.setTitle(title, for: .normal)
        case .yes(let title):
            self.setTitle(title, for: .normal)
        case .cancel(let title):
            self.setTitle(title, for: .normal)
        }
    }
}
