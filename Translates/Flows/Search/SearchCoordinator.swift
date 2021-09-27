//
//  SearchCoordinator.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

final class SearchCoordinator: BaseCoordinator, SearchCoordinatorOutput {
  
    var finishFlow: CompletionBlock?
    
    private let factory: SearchFactory
    private let router: Routable
    private let coordinatorFactory: CoordinatorFactoryProtocol
    
    init(with factory: SearchFactory,
         router: Routable,
         coordinatorFactory: CoordinatorFactoryProtocol) {
        self.factory = factory
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
}

// MARK: - Coordinatable

extension SearchCoordinator: Coordinatable {
    func start() {
        performFlow()
    }
}

// MARK: - Private methods

private extension SearchCoordinator {
    
    func performFlow() {
        let view = factory.makeSearchView()
        
        view.onDetailWord = { [weak self] input in
            self?.performDetailWord(with: input)
        }
        
        router.setRootModule(view, hideNavigationBar: false, rootAnimated: true)
    }
    
    func performDetailWord(with input: DetailWordPresenter.Input) {
        let navController = BaseNavigationController()
       
        let coordinator = coordinatorFactory.makeDetailWordCoordinator(
            router: Router(rootController: navController),
            originRouter: router
        )
        
        coordinator.finishFlow = { [weak self] in
            self?.removeDependency(coordinator)
        }
        
        addDependency(coordinator)
        (coordinator as? DetailWordCoordinator)?.start(with: input)
    }
    
}
