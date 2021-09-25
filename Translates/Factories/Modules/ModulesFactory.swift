//
//  ModulesFactory.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//


final class ModulesFactory:
    TranslateLauncherFactory,
    TabBarFactory,
    SearchFactory,
    DictionaryFactory
{
    func makeDictionaryView() -> DictionaryViewProtocol {
        let view = DictionaryViewController()
        DictionaryAssembly.assembly(with: view)
        return view
    }
    
    func makeSearchView() -> SearchViewProtocol {
        let view = SearchViewController()
        SearchAssembly.assembly(with: view)
        return view
    }
    
    func makeTabBarView() -> TabBarViewProtocol {
        let view = TabBarViewController()
        TabBarAssembly.assembly(with: view)
        return view
    }
    
    func makeTranslateLauncherView() -> TranslateLauncherViewProtocol {
        let view = TranslateLauncherViewController()
        TranslateLauncherAssembly.assembly(with: view)
        return view
    }
}
