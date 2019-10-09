//
//  PurchaseManager.swift
//  Desafio Orama
//
//  Created by THIAGO on 08/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import CoreData

class PurchaseManager: CoredataManager {
    
    static func save(item: DetailItem) -> Bool {
        Fund.createFund(item: item)
        return saveContext()
    }
    
    static func getList() -> [Fund] {
        let managedContext = LoginManager.persistentContainer.viewContext
        let request = NSFetchRequest<Fund>(entityName:"Fund")
        do {
            let result = try managedContext.fetch(request)
            return result
        }catch {
            return []
        }
    }
}
