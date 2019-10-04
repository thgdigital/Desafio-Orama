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
    
    func makeScreen(window: UIWindow?) -> UINavigationController? {
        
        self.window = window
       
        let homeController = HomeControllerBuilder.make(wireframe: self)
        
        let navigation = UINavigationController(rootViewController: homeController)
        
        return navigation
    }
}
