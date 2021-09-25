//
//  SearchBarTranslate.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//

import UIKit

class SearchBarTranslate: BaseView {
    
    /// Поиск
    var searchWithText: ((String?) -> Void)?
    /// Текст поиска был удален
    var didTapDeleteKey: (() -> Void)?
    /// Текст поиска изменен
    var textDidChange: ((String?) -> Void)?
    /// ShouldBeginEditing
    var startSearch: (() -> Void)?
    /// EndEditing
    var endSearch: (() -> Void)?
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = -4
        return stackView
    }()

    let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.tintColor = .tBlack
        sb.showsCancelButton = false
        sb.isTranslucent = false
        sb.placeholder = "search_placeholder".localized
        sb.backgroundImage = UIImage()
        sb.bacgroundTextFiled(with: UIColor(rgb: 0x767680).withAlphaComponent(0.05))
        return sb
    }()
    
    /// SearchBar delete btn
    private var didTapDelete = false

    override func initUI() {
        self.clipsToBounds = false
        self.backgroundColor = .tWhite
        self.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 0
        self.layer.shadowColor = UIColor.black.cgColor
        
        self.addSubviews(stackView)
        stackView.addArrangedSubview(searchBar)
        
        searchBar.delegate = self
    }
    
    override func initConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SearchBarTranslate: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchWithText?(searchBar.text)
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
    }
    
    func searchBar(_ searchBar: UISearchBar,
                   shouldChangeTextIn range: NSRange,
                   replacementText text: String) -> Bool {
        didTapDelete = text.isEmpty
        return true
    }

    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        textDidChange?(searchText)
        if searchText.isEmpty {
            didTapDeleteKey?()
        }

        didTapDelete = false
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
       
        searchBar.showsCancelButton = true
        if let cBtn = searchBar.value(forKey: "cancelButton") as? UIButton {
            cBtn.setTitle("cancel".localized, for: .normal)
        }
        
        startSearch?()
        searchBar.endEditing(true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
        endSearch?()
    }
}
