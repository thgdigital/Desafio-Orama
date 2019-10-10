//
//  MylistProtocol.swift
//  Desafio Orama
//
//  Created by THIAGO on 09/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

protocol MylistPresenterInput {
    func viewDidLoad()
}

protocol MylistPresenterOuput: class {
    func fetched(items: [FundItem])
}

protocol MylistInteractorInput {
    func fetch()
 
}

protocol MylistInteractorOuput: class {
    func fetched(entites: [MylistEntity])
}
