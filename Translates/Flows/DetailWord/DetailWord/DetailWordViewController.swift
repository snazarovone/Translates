//
//  DetailWordViewController.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

/**
 Полная информация о слове
 */
class DetailWordViewController: BaseViewController, DetailWordAssemblable {
    
    var presenter: DetailWordPresenterInput?
    
    var onCompletion: CompletionBlock?
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = .tWhite
        tv.estimatedRowHeight = 100
        return tv
    }()
    
    var dataSource: DetailWordDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .tWhite
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func initUI() {
        
        view.addSubviews(tableView)
        dataSource = DetailWordDataSource(tableView: tableView)
        tableView.delegate = self
        
        presenter?.onStart()
    }
    
    override func initConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    deinit {
        print("DetailWordViewController is deinit")
    }
}

// MARK: - DetailWordPresenterOutput

extension DetailWordViewController {
    func setTitleNavigation(with text: String) {
        title = text
    }
    
    func prepareData(word: String, meaning: MeaningsModel) {
        dataSource?.prepareData(word: word, meaning: meaning)
    }
}
