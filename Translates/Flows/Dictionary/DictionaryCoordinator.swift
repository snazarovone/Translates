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
    
    init(with factory: DictionaryFactory, router: Routable) {
        self.factory = factory
        self.router = router
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
        
        router.setRootModule(view, hideNavigationBar: false, rootAnimated: true)
    }
    
}
