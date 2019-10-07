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
}

protocol LoginInteractorOutput: class {
    
}

class LoginInteractor: LoginInteractorInput {
    
    var isLogged: Bool = false
    
    var manager: LoginManager
    
    init(manager: LoginManager) {
        self.manager = manager
    }

}
