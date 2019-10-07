//
//  DetailWireframe.swift
//  Desafio Orama
//
//  Created by THIAGO on 06/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class DetailWireframe {
    
    func makeScreen(item: DetailItem) -> DetailController {
        let presenter = DetailPresenter(item: item, wireframe: self)
        let layout = UICollectionViewFlowLayout()
        let controller = DetailController(collectionViewLayout: layout)
        presenter.output = controller
        controller.presenter = presenter
        return controller
    }
}
