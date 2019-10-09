//
//  Fund+extension.swift
//  Desafio Orama
//
//  Created by THIAGO on 08/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import CoreData

extension Fund {
    
    @discardableResult
    static func createFund(item: DetailItem) -> NSManagedObject {
        let managedContext = CoredataManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Fund", in: managedContext)!
        let fundModel = NSManagedObject(entity: entity, insertInto: managedContext)
       fundModel.setValue(item.descriptionManager, forKey: "descriptionManager")
        fundModel.setValue(item.fullName, forKey: "fullName")
        fundModel.setValue(item.initialDate, forKey: "initialDate")
        fundModel.setValue(item.minimumInitialApplicationAmount, forKey: "minimumInitialApplicationAmount")
        fundModel.setValue(item.simpleName, forKey: "simpleName")
        fundModel.setValue(item.thumbnailVideo, forKey: "thumbnailVideo")
        fundModel.setValue(item.urlVideo, forKey: "urlVideo")
        return fundModel
    }
}
