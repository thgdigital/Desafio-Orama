//
//  HomeDisplayMapper.swift
//  Desafio Orama
//
//  Created by THIAGO on 04/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class HomeDisplayMapper {
    static func make(item: HomeItem) -> HomeDisplay {
        let display = HomeDisplay()
        display.name = item.simpleName
        display.currency = "R$ \(item.minimumInitialApplicationAmount)"
        return display
    }
}
