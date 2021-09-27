//
//  DictionaryCoordinator.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

final class DictionaryCoordinator: BaseCoordinator, DictionaryCoordinatorOutput {
  
    var finishFlow: CompletionBlock?
    
    private let factory: DictionaryFactory
    private let router: Routable
    private let coordinatorFactory: CoordinatorFactoryProtocol
    
    init(with factory: DictionaryFactory,
         router: Routable,
         coordinatorFactory: CoordinatorFactoryProtocol) {
        self.factory = factory
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
}

// MARK: - Coordinatable

extension DictionaryCoordinator: Coordinatable {
    func start() {
        performFlow()
    }
}

// MARK: - Private methods

private extension DictionaryCoordinator {
    
    func performFlow() {
        let view = factory.makeDictionaryView()
        
        view.onDetailWord = { [weak self] input in
            self?.performDetailWord(with: input)
        }
        
        view.onDialogRemove = { [weak self] in
            self?.showDialogRemove()
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
    
    func showDialogRemove() {
        let view = factory.makeDialogRemoveView()
        
        view.onCompletion = { [weak self] in
            self?.router.dismissModule()
        }
        
        router.presentOverfullscreen(view, animated: true)
    }
}
