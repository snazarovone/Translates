//
//  SearchInteractor.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit
import RealmSwift

final class SearchInteractor {

    unowned var presenter: SearchPresenter?
    
    private let apiWrapper = APIWrapperMain()
    
    private let realmManager = RealmService.shared
    private var notification: NotificationToken?

    private (set) var words = [MeaningsModel]()
    
    
    /**
     Постраничный поиск слов
     - Parameter request: Параметры запроса
     - Parameter add: Добавить/Перезаписать данные
    */
    func searchText(with request: SearchRequest,
                    is add: Bool) {
        apiWrapper.searchWord(with: request) { [weak self] result in
            switch result {
            case .success(let responseData):
                self?.presenter?.onSuccessSearch(with: responseData, is: add)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
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
                self.presenter?.reloadData()
            case .error(let error):
                print(error)
            case .update(let listObject, _, _, _):
                self.words = Array(listObject).compactMap({ $0.meaningsModel })
                self.presenter?.reloadData()
            }
        })
    }
    
    deinit {
        notification?.invalidate()
        print("DictionaryInteractor is deinit")
    }
}
