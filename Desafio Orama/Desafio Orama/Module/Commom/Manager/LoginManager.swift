//
//  LoginManager.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import CoreData

class LoginManager: NSObject {
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "OramaModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {}
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    
    static func saveUser(email: String, password: String) -> Bool {
        let managedContext = persistentContainer.viewContext
        let _ = User.createUser(email: email, password: password)
        
        do {
            try managedContext.save()
            return true
        } catch {
            return false
        }

    }
    
    
    static func saveContext() -> Bool {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
                return true
            } catch {
                print("An error occurred while saving: \(error)")
                return false
            }
        }
        return false
    }
}
