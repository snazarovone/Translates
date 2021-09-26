//
//  DetailWordCoordinator.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//  
//

import UIKit

final class DetailWordCoordinator: BaseCoordinator, DetailWordCoordinatorOutput {
  
    var finishFlow: CompletionBlock?
    
    private let factory: DetailWordFactory
    private let router, originRouter: Routable
    
    init(with factory: DetailWordFactory,
         router: Routable,
         originRouter: Routable) {
        self.factory = factory
        self.router = router
        self.originRouter = originRouter
    }
}

// MARK: - Coordinatable

extension DetailWordCoordinator: Coordinatable {
    func start() {
    }
    
    func start(with input: DetailWordPresenter.Input) {
        performFlow(with: input)
    }
}

// MARK: - Private methods

private extension DetailWordCoordinator {
    
    func performFlow(with input: DetailWordPresenter.Input) {
        let view = factory.makeDetailWordView(with: input)
        
        view.onCompletion = { [weak self] in
            self?.router.dismissModule()
            self?.finishFlow?()
        }
        
        router.setRootModule(view, hideNavigationBar: false, rootAnimated: false)
        
        originRouter.present(router.toPresent, animated: true)
    }
    
}
