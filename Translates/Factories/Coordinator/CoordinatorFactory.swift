//
//  CoordinatorFactory.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

final class CoordinatorFactory {
    
    private let modulesFactory = ModulesFactory()
    
}

// MARK: - CoordinatorFactoryProtocol

extension CoordinatorFactory: CoordinatorFactoryProtocol {
    
    func makeDetailWordCoordinator(router: Routable, originRouter: Routable)
    -> Coordinatable & DetailWordCoordinatorOutput {
        DetailWordCoordinator(with: modulesFactory, router: router, originRouter: originRouter)
    }
    
    func makeDictionaryCoordinator(router: Routable,
                                   coordinatorFactory: CoordinatorFactoryProtocol) -> Coordinatable & DictionaryCoordinatorOutput {
        DictionaryCoordinator(
            with: modulesFactory,
            router: router,
            coordinatorFactory: coordinatorFactory
        )
    }
    
    func makeTabBarCoordinator(router: Routable, coordinatorFactory: CoordinatorFactoryProtocol) -> Coordinatable & TabBarCoordinatorOutput {
        TabBarCoordinator(router: router, coordinatorFactory: coordinatorFactory)
    }
    
    func makeSearchCoordinator(router: Routable, coordinatorFactory: CoordinatorFactoryProtocol) -> Coordinatable & SearchCoordinatorOutput {
        SearchCoordinator(with: modulesFactory, router: router, coordinatorFactory: coordinatorFactory)
    }
    
    func makeTranslateLauncher(router: Routable)
    -> Coordinatable & TranslateLauncherCoordinatorOutput {
        TranslateLauncherCoordinator(with: modulesFactory, router: router)
    }
}

// MARK: - Private methods

private extension CoordinatorFactory {
    
    func router(_ navController: UINavigationController?) -> Routable {
        Router(rootController: navigationController(navController))
    }
    
    func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            return UINavigationController()
        }
    }
    
}
