//
//  CoordinatorFactoryProtocol.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol CoordinatorFactoryProtocol {
    
    func makeDictionaryCoordinator(router: Routable) -> Coordinatable & DictionaryCoordinatorOutput
    
    func makeSearchCoordinator(router: Routable) -> Coordinatable & SearchCoordinatorOutput
    
    func makeTranslateLauncher(router: Routable) -> Coordinatable & TranslateLauncherCoordinatorOutput
    
    func makeTabBarCoordinator(router: Routable,
                               coordinatorFactory: CoordinatorFactoryProtocol)
    -> Coordinatable & TabBarCoordinatorOutput
}
