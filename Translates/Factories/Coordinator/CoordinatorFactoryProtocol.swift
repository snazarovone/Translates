//
//  CoordinatorFactoryProtocol.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol CoordinatorFactoryProtocol {
    
    func makeTranslateLauncher(router: Routable) -> Coordinatable & TranslateLauncherCoordinatorOutput
    
    func makeRootCoordinator(router: Routable) -> Coordinatable & RootCoordinatorOutput
}
