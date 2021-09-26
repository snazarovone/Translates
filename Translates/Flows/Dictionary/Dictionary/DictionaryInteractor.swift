//
//  DictionaryInteractor.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import RealmSwift

final class DictionaryInteractor {

    unowned var presenter: DictionaryPresenter?
    
    private let realmManager = RealmService.shared
    private var notification: NotificationToken?

    private (set) var words = [MeaningsModel]()
}
