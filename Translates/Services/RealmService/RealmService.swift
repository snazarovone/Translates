//
//  BaseTargetType.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//
//

import Foundation
import RealmSwift

class RealmService: RealmServiceProtocol {
    
    static let shared = RealmService()
    
    static func setupRealm() {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            
            schemaVersion: UInt64(Bundle.main.buildVersionNumber)!,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { _, _ in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
            }
        )
        
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
        // Realm.Configuration.defaultConfiguration.encryptionKey = realmKey
        
        if TARGET_OS_SIMULATOR != 0 {
            // Save db to Mac Desktop
            let dbPath = String(
                format: "/Users/%@/Desktop/Translate/",
                NSHomeDirectory().components(separatedBy: "/")[2]
            )
            // swiftlint:disable:next force_try
            try! FileManager.default.createDirectory(
                at: URL(fileURLWithPath: dbPath),
                withIntermediateDirectories: true,
                attributes: nil
            )
            Realm.Configuration.defaultConfiguration.fileURL = URL(string: dbPath.appending("Translate.realm"))
        }
    }
    
    // swiftlint:disable:next force_try
    let realm = try! Realm()
}

extension RealmService {
    /// Отчистить БД
    func removeAll() {
        try? realm.write({
            realm.deleteAll()
        })
    }
    
    // MARK: - Words
    /**
     Сохранить  слово
     - Parameter clientTypesModel: Список бизнесов c названиями
     */
    func updateWord(_ meaningsModel: MeaningsModel?) {
        DispatchQueue(label: "background dictionary").async {
            autoreleasepool {
                // Get realm and table instances for this thread
                let realm = try? Realm()
                
                realm?.beginWrite()
                let clientRM = MeaningsModelRM(meaningsModel: meaningsModel)
                realm?.create(MeaningsModelRM.self, value: clientRM, update: .all)
                try? realm?.commitWrite()
            }
        }
    }
    
    /**
     Получить сохраненные слова
     - Returns: Опциональная модель Слово
     */
    func getObjectWordModel() -> Results<MeaningsModelRM> {
         realm.objects(MeaningsModelRM.self)
    }
    
    /**
     Удалить слово
     */
    func removeObjectWordModel(by id: Int?) {
        guard let id = id,
              let object = realm.object(
                ofType: MeaningsModelRM.self,
                forPrimaryKey: "primaryKey \(id)"
              ) else {
            return
        }
        try? realm.write({
            realm.delete(object)
        })
    }
    
    /**
     Получить слово
     */
    func getWordModel(by id: Int?) -> MeaningsModel? {
        guard let id = id,
              let object = realm.object(
                ofType: MeaningsModelRM.self,
                forPrimaryKey: "primaryKey \(id)"
              ) else {
            return nil
        }
        return object.meaningsModel
    }
}
