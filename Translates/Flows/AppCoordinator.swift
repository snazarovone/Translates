//
//  AppCoordinator.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import Foundation

private enum LaunchInstructor {
    case launcher
    case main
}

final class AppCoordinator: BaseCoordinator {
    
    private let factory: CoordinatorFactoryProtocol
    private let router: Routable
    
    private var instructor: LaunchInstructor = .launcher
    
    init(router: Routable, factory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
    }
    
}

// MARK: - Coordinatable

extension AppCoordinator: Coordinatable {
    func start() {
        switch instructor {
        case .launcher:
            performLauncher()
        case .main:
            performMainFlow()
        }
    }
}

// MARK: - Private methods

private extension AppCoordinator {
    
    func performLauncher() {
        let coordinator = factory.makeTranslateLauncher(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            guard let self = self,
                let coordinator = coordinator else {
                return
            }
            
            self.instructor = .main
            self.start()
            self.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    func performMainFlow() {
        let coordinator = factory.makeTabBarCoordinator(
            router: router,
            coordinatorFactory: factory
        )
        coordinator.finishFlow = { [weak self, weak coordinator] in
            guard let self = self,
                let coordinator = coordinator else {
                return
            }
            
            self.start()
            self.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
