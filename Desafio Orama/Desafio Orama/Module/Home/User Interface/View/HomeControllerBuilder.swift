//
//  HomeControllerBuilder.swift
//  Desafio Orama
//
//  Created by THIAGO on 03/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class HomeControllerBuilder {
    
    static func make(wireframe: HomeWireframe) -> HomeController {
        let interactor = HomeInteractor(manager: RequestManager())
        let presenter = HomePresenter(interactor: interactor, wireframe: wireframe)
        let layout = UICollectionViewFlowLayout()
        let homeController = HomeController(collectionViewLayout: layout)
        homeController.presenter = presenter
        presenter.output = homeController
        interactor.output = presenter
    
        return homeController
    }
}
