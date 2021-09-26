//
//  SearchInteractor.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

final class SearchInteractor {

    unowned var presenter: SearchPresenter?
    
    private let apiWrapper = APIWrapperMain()
    
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
}
