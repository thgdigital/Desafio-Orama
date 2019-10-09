//
//  User+Extension.swift
//  Desafio Orama
//
//  Created by THIAGO on 08/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import CoreData

extension User {
    
    @discardableResult
    static func createUser(email: String, password: String) -> NSManagedObject {
        let managedContext = LoginManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        let userModel = NSManagedObject(entity: entity, insertInto: managedContext)
        userModel.setValue(email, forKey: "email")
        userModel.setValue(password, forKey: "password")
        return userModel
    }
    
    static func getUser() -> User? {
        let managedContext = LoginManager.persistentContainer.viewContext
        let request = NSFetchRequest<User>(entityName:"User")
        request.fetchLimit = 1
        do {
            let result = try managedContext.fetch(request)
            guard result.count == 1, let user = result.first else {
                return nil
            }
            return user
        }catch {
            return nil
        }
    }
}

