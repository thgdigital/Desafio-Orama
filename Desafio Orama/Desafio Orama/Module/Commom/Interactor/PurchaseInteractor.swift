//
//  PurchaseInteractor.swift
//  Desafio Orama
//
//  Created by THIAGO on 08/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

protocol PurchaseInteractorInput {
    func save(item: DetailItem)
}

protocol PurchaseInteractorOutput: class {
    func didSaved()
    func didErrorSaved()
}

class PurchaseInteractor: PurchaseInteractorInput {
    var output: PurchaseInteractorOutput?
    
    func save(item: DetailItem) {
        let status = PurchaseManager.save(item: item)
        guard status else {
            output?.didErrorSaved()
            return
        }
        output?.didSaved()
    }

}
