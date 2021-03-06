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
class DetailWordViewController: BaseViewController,
                                DetailWordAssemblable,
                                WithNavigationItem {
    
    var presenter: DetailWordPresenterInput?
    
    var onCompletion: CompletionBlock?
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = .tWhite
        tv.estimatedRowHeight = 100
        tv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        return tv
    }()
    
    private let dictAction = TranslateButton()
    
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
        
        view.addSubviews(tableView, dictAction)
        dataSource = DetailWordDataSource(tableView: tableView)
        tableView.delegate = self
        
        presenter?.onStart()
    }
    
    override func initConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        dictAction.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-32)
            make.height.equalTo(54)
        }
    }
    
    override func initListeners() {
        dictAction.touchUp = { [weak self] _ in
            self?.presenter?.dictionaryAction()
        }
        
        navigationItem(set: .right(type: .close)) { [weak self] _ in
            self?.onCompletion?()
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
    
    func prepareData(word: String,
                     meaning: MeaningsModel,
                     model: MeaningsResponseModel?) {
        dataSource?.prepareData(word: word, meaning: meaning, model: model)
    }
    
    func loadingData(_ animating: Bool) {
        DispatchQueue.main.async {
            if animating {
                self.tableView.startLoading()
            } else {
                self.tableView.stopLoading()
            }
        }
    }
    
    func updateStyleAction(with type: StyleButton) {
        dictAction.setStyle(with: type)
    }
}
