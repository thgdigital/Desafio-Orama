//
//  LoginInteractor.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

protocol LoginInteractorInput {
    var isLogged: Bool { get set }
    func save(email: String, password: String, completion:  @escaping ((Bool) -> Void))
}

protocol LoginInteractorOutput: class {
    func didLogged()
    func didLogout()
}

class LoginInteractor: LoginInteractorInput {
    
    weak var output: LoginInteractorOutput?
    
    var isLogged: Bool = User.getUser() != nil
    
    func save(email: String, password: String, completion: @escaping ((Bool) -> Void)) {
        let status = LoginManager.saveUser(email: email, password: password)
        
        if status {
            output?.didLogged()
        }
        completion(status)
    }
}
