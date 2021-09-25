//
//  TabBarCoordinator.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit

enum TabItem: String, CaseIterable {
    case search
    case dictionary
    
    var title: String {
        switch self {
        case .search:
            return "tab_\(TabItem.search.rawValue)".localized
        case .dictionary:
            return "tab_\(TabItem.dictionary.rawValue)".localized
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .search:
            return UIImage(named: "icon_\(TabItem.search.rawValue)")
        case .dictionary:
            return UIImage(named: "icon_\(TabItem.dictionary.rawValue)")
        }
    }
}

final class TabBarCoordinator: BaseCoordinator, TabBarCoordinatorOutput {
  
    var finishFlow: CompletionBlock?
    
    private let modulesFactory = ModulesFactory()
    private var itemRouters = [TabItem: Router]()
    
    private let router: Routable
    private let coordinatorFactory: CoordinatorFactoryProtocol
    
    private let tabBarViewController = TabBarViewController()
    

    init(router: Routable,
         coordinatorFactory: CoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        
        super.init()
        
        TabItem.allCases.forEach {
            initCoordinator(type: $0)
        }
    }

    // swiftlint:disable function_body_length
    func initCoordinator(type: TabItem) {
        let navController = BaseNavigationController()
        let router = Router(rootController: navController)
        
        navController.tabBarItem.title = type.title
        navController.tabBarItem.image = type.icon
        
        switch type {
        case .search:
            let coordinator = SearchCoordinator(
                with: modulesFactory,
                router: router
            )
            coordinator.start()
            addDependency(coordinator)
        case .dictionary:
            let coordinator = DictionaryCoordinator(
                with: modulesFactory,
                router: router
            )
            coordinator.start()
            addDependency(coordinator)
        }
        itemRouters[type] = router
    }
}

// MARK: - Coordinatable

extension TabBarCoordinator: Coordinatable {
    func start() {
        performFlow()
    }
}

// MARK: - Private methods

private extension TabBarCoordinator {
    func performFlow() {

        var controllers = [UIViewController]()
        TabItem.allCases.forEach { tab in
            if let vc = itemRouters[tab]?.toPresent {
                controllers.append(vc)
            }
        }
    
        self.tabBarViewController.setViewControllers(controllers, animated: false)
        
        tabBarViewController.selectedIndex = 0
        router.setRootModule(tabBarViewController, hideNavigationBar: true, rootAnimated: false)
    }
}
