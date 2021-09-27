//
//  AppDelegate.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private lazy var coordinator: Coordinatable = self.makeCoordinator()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        RealmService.setupRealm()
        
        coordinator.start()
        
        window?.makeKeyAndVisible()
        
        return true
    }

}

// MARK: - Private methods

private extension AppDelegate {
    
    func makeCoordinator() -> Coordinatable {
        let navController = BaseNavigationController()
        
        window?.rootViewController = navController
        
        return AppCoordinator(
            router: Router(rootController: navController),
            factory: CoordinatorFactory()
        )
    }
    
}

