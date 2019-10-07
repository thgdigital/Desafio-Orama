//
//  DetailProtocol.swift
//  Desafio Orama
//
//  Created by THIAGO on 06/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

protocol DetailPresenterInput {
    func viewDidLoad()
    func didSelected()
    
}
protocol DetailPresenterOuput: class {
    func createLayout(title: String)
}
protocol DetailInteractorInput {
    
}
protocol DetailInteractorOuput: class {
    
}
