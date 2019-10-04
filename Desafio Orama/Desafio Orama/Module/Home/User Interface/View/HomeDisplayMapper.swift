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
        var currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "pt_BR")
        if let currency = Float(item.minimumInitialApplicationAmount),
            let priceString = currencyFormatter.string(from: NSNumber(value: currency) ) {
            display.currency = priceString
        }
        
        display.riskProfile = item.fundRiskProfile
        return display
    }
}
