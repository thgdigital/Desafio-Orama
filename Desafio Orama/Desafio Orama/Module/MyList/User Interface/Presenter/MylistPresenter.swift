//
//  MylistPresenter.swift
//  Desafio Orama
//
//  Created by THIAGO on 09/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class MylistPresenter: MylistPresenterInput {
    
    weak var ouput: MylistPresenterOuput?
    
    var interactor: MylistInteractorInput
    
    init(interactor: MylistInteractorInput) {
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor.fetch()
    }
    
}
extension MylistPresenter: MylistInteractorOuput {
    
    func fetched(entites: [MylistEntity]) {
        ouput?.fetched(items: entites.map({ MylistEntityMapper.make(entity: $0)}))
    }
}
