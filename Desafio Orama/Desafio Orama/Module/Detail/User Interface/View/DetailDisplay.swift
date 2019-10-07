//
//  DetailDisplay.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

struct DetailDisplay {
    var name: String = ""
    var date: String? = ""
    var descriptionManager: String = ""
    
    init(item: DetailItem) {
        self.name = item.fullName
        self.descriptionManager = item.descriptionManager
        if let dateString = getDate(stringDate: item.initialDate) {
             self.date = "Data de início: \(dateString)"
        }
    }
    
    func getDate(stringDate: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        guard let date = dateFormatter.date(from: stringDate) else {
            return nil
        }
        dateFormatter.dateFormat = "dd/mm/yyyy"
        
        return dateFormatter.string(from: date)
    }
}
