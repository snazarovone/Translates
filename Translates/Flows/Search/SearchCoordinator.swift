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
    
    init(with factory: SearchFactory, router: Routable) {
        self.factory = factory
        self.router = router
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
        
        router.setRootModule(view, hideNavigationBar: false, rootAnimated: true)
    }
    
}
