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
    DictionaryFactory,
    DetailWordFactory
{
    func makeDialogRemoveView() -> DialogRemoveViewProtocol {
        let view = DialogRemoveViewController()
        DialogRemoveAssembly.assembly(with: view)
        return view
    }
    
    func makeDetailWordView(with input: DetailWordPresenter.Input)
    -> DetailWordViewProtocol {
        let view = DetailWordViewController()
        DetailWordAssembly.assembly(with: view, by: input)
        return view
    }
    
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
