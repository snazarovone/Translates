//
//  MeaningsModelRM.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//

import Foundation
import RealmSwift

class MeaningsModelRM: Object {
    
    @objc private dynamic var structData: Data?
    
    @objc dynamic var compoundKey: String = "primaryKey"
 
    override static func primaryKey() -> String? {
        "compoundKey"
    }
    
    private func compoundKeyValue(with id: String) -> String {
        "\(compoundKey) \(id)"
    }
    
    var meaningsModel: MeaningsModel? {
        get {
            if let data = structData {
                return try? JSONDecoder().decode(MeaningsModel.self, from: data)
            }
            return nil
        }
        set {
            structData = try? JSONEncoder().encode(newValue)
        }
    }
    
    convenience init(meaningsModel: MeaningsModel?) {
        self.init()
        self.meaningsModel = meaningsModel
        compoundKey = compoundKeyValue(with: "\(meaningsModel?.id ?? 0)")
    }
}
