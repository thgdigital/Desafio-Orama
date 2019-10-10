//
//  MylistInteractor.swift
//  Desafio Orama
//
//  Created by THIAGO on 09/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class MylistInteractor: MylistInteractorInput {
    
    weak var output: MylistInteractorOuput?
    
    func fetch() {
        let models = PurchaseManager.getList()
        output?.fetched(entites: models.map({ MylistEntityMapper.make(model: $0)}))
    }
    
}
