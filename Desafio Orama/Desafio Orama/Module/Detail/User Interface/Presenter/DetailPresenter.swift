//
//  DetailPresenter.swift
//  Desafio Orama
//
//  Created by THIAGO on 06/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenterInput {
    weak var output: DetailPresenterOuput?
    var wireframe: DetailWireframe
    var item: DetailItem
    
    init(item: DetailItem, wireframe: DetailWireframe) {
        self.item = item
        self.wireframe = wireframe
    }
    
    func viewDidLoad() {
        output?.createLayout(title: "Detalhe do Fundo")
    }
    
    func didSelected() {
        
    }
    
}
