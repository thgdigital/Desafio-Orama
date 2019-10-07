//
//  HomeWireframe.swift
//  Desafio Orama
//
//  Created by THIAGO on 03/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit


class HomeWireframe: NSObject {
    
    var window: UIWindow?
    var navigation: UINavigationController?
    
    func makeScreen(window: UIWindow?) -> UINavigationController? {
        
        self.window = window
        
        let homeController = HomeControllerBuilder.make(wireframe: self)
        
        navigation = UINavigationController(rootViewController: homeController)
        
        return navigation
    }
    
    func showDetail(detailItem: DetailItem) {
        let detailController = DetailWireframe().makeScreen(item: detailItem)
        navigation?.pushViewController(detailController, animated: true)
    }
}
