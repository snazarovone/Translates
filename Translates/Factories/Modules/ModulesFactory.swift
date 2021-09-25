//
//  ModulesFactory.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//


final class ModulesFactory:
    RootFactory,
    TranslateLauncherFactory
{
    func makeTranslateLauncherView() -> TranslateLauncherViewProtocol {
        let view = TranslateLauncherViewController()
        TranslateLauncherAssembly.assembly(with: view)
        return view
    }
    
    func makeMainView() -> MainViewProtocol {
        let view = MainViewController()
//        HomeAssembly.assembly(with: view)
        return view
    }
}
