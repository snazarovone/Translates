//
//  EmptyTableViewCell.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//
import UIKit

class EmptyTableViewCell: UITableViewCell, Configurable {

    private let emptyView: UIView = {
        let view = UIView()
        return view
    }()
    
    var model: EmptyCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }
    
    func initUI() {
        addSubview(emptyView)
        emptyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(0)
        }
    }
    
    func configure(with model: EmptyCellModel) {
        self.model = model
        emptyView.snp.updateConstraints { make in
            make.height.equalTo(model.height)
        }
    }
}
