//
//  DetailWordInteractor.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

final class DetailWordInteractor {

    unowned var presenter: DetailWordPresenter?
    
    private let apiWrapper = APIWrapperMain()

    func meanings(with id: String) {
        apiWrapper.meaningsRequest(
            with: MeaningsRequest(ids: id)) { [weak self] result in
            switch result {
            case .success(let model):
                self?.presenter?.success(with: model)
            case .failure(let error):
                print(error.localizedDescription)
                self?.presenter?.failer()
            }
        }
    }

}
