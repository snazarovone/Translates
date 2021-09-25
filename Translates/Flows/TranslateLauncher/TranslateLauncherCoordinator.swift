//
//  TranslateLauncherCoordinator.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

final class TranslateLauncherCoordinator: BaseCoordinator, TranslateLauncherCoordinatorOutput {
  
    var finishFlow: CompletionBlock?
    
    private let factory: TranslateLauncherFactory
    private let router: Routable
    
    init(with factory: TranslateLauncherFactory, router: Routable) {
        self.factory = factory
        self.router = router
    }
}

// MARK: - Coordinatable

extension TranslateLauncherCoordinator: Coordinatable {
    func start() {
        performFlow()
    }
}

// MARK: - Private methods

private extension TranslateLauncherCoordinator {
    
    func performFlow() {
        let view = factory.makeTranslateLauncherView()
        
        view.onCompletion = finishFlow
        
        router.setRootModule(view, hideNavigationBar: false, rootAnimated: true)
    }
    
}
