//
//  CoordinatorFactoryProtocol.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol CoordinatorFactoryProtocol {
    
    func makeDetailWordCoordinator(router: Routable, originRouter: Routable)
    -> Coordinatable & DetailWordCoordinatorOutput
    
    func makeDictionaryCoordinator(router: Routable,
                                   coordinatorFactory: CoordinatorFactoryProtocol) -> Coordinatable & DictionaryCoordinatorOutput
    
    func makeSearchCoordinator(router: Routable, coordinatorFactory: CoordinatorFactoryProtocol)
    -> Coordinatable & SearchCoordinatorOutput
    
    func makeTranslateLauncher(router: Routable) -> Coordinatable & TranslateLauncherCoordinatorOutput
    
    func makeTabBarCoordinator(router: Routable,
                               coordinatorFactory: CoordinatorFactoryProtocol)
    -> Coordinatable & TabBarCoordinatorOutput
}
