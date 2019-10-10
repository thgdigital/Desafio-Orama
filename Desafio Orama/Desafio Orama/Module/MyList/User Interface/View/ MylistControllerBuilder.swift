//
//   MylistControllerBuilder.swift
//  Desafio Orama
//
//  Created by THIAGO on 09/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit


class MylistControllerBuilder {
    
    static func make() -> MylistController {
        let interactor = MylistInteractor()
        let presenter = MylistPresenter(interactor: interactor)
        interactor.output = presenter
        let layout = UICollectionViewFlowLayout()
        let controller = MylistController(collectionViewLayout: layout)
        controller.presenter = presenter
        presenter.ouput = controller
        return controller
    }
}
