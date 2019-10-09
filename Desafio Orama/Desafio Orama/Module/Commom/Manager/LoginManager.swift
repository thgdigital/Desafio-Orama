//
//  LoginManager.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import CoreData

class LoginManager: CoredataManager {
    
    static func saveUser(email: String, password: String) -> Bool {
        User.createUser(email: email, password: password)
        return saveContext()
    }
}
