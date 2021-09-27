//
//  DictionaryInteractor.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import RealmSwift

final class DictionaryInteractor {

    unowned var presenter: DictionaryPresenter?
    
    private let realmManager = RealmService.shared
    private var notification: NotificationToken?

    private (set) var words = [MeaningsModel]()
    
    func observeCategory() {
        let words = realmManager.getObjectWordModel()
        
        // Observe Results Notifications
        notification = words.observe({ [weak self] change in
            guard let self = self else {
                return
            }
            switch change {
            case .initial(let listObject):
                self.words = Array(listObject).compactMap({ $0.meaningsModel })
                self.presenter?.reloadData(with: self.words)
            case .error(let error):
                print(error)
            case .update(let listObject, _, _, _):
                self.words = Array(listObject).compactMap({ $0.meaningsModel })
                self.presenter?.reloadData(with: self.words)
            }
        })
    }
    
    deinit {
        notification?.invalidate()
        print("DictionaryInteractor is deinit")
    }
}
