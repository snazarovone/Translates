//
//  CoordinatorFactoryProtocol.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

protocol CoordinatorFactoryProtocol {
    
    func makeRootCoordinator(router: Routable) -> Coordinatable & RootCoordinatorOutput
}
