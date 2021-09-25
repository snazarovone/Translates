//
//  RootCoordinator.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

class RootCoordinator: BaseCoordinator, RootCoordinatorOutput {
    
    var rootViewController: UIViewController?
    var finishFlow: CompletionBlock?
    
    private let factory: RootFactory
    private let router: Routable
    
    init(with factory: RootFactory, router: Routable) {
        self.factory = factory
        self.router = router
    }
}

// MARK: - Coordinatable

// swiftlint:disable all
extension RootCoordinator: Coordinatable {
    
    func start() {
        performRoot()
    }
    
    func performRoot() {
        let view = factory.makeMainView()
        rootViewController = view.toPresent
        view.onCompletion = finishFlow
        
        router.setRootModule(view, hideNavigationBar: true, rootAnimated: false)
    }
    
}
