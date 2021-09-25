//
//  AppCoordinator.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Foundation

private enum LaunchInstructor {
    
    case main
        
    static func setup() -> LaunchInstructor {
        return .main
    }
    
}

final class AppCoordinator: BaseCoordinator {
    
    private let factory: CoordinatorFactoryProtocol
    private let router: Routable
    
    private var instructor: LaunchInstructor {
        LaunchInstructor.setup()
    }
    
    init(router: Routable, factory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
    }
    
}

// MARK: - Coordinatable

extension AppCoordinator: Coordinatable {
    func start() {
        switch instructor {
        case .main:
            performMainFlow()
        }
    }
}

// MARK: - Private methods

private extension AppCoordinator {
    
    func performMainFlow() {
        let coordinator = factory.makeRootCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            guard
                let self = self,
                let coordinator = coordinator
                else { return }
            
            self.start()
            self.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
