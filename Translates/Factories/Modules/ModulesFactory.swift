//
//  ModulesFactory.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//


final class ModulesFactory:
    RootFactory
{
    func makeMainView() -> MainViewProtocol {
        let view = MainViewController()
//        HomeAssembly.assembly(with: view)
        return view
    }
}
