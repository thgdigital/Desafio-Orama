//
//  HomeInteractor.swift
//  Desafio Orama
//
//  Created by THIAGO on 03/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import Alamofire



class HomeInteractor: HomeInteractorInput {
    weak var output: HomeInteractorOutput?
    var manager: RequestManager
    var page: UInt = 1
    var limit: UInt = 6
    var shoudPagination: Bool = false
    var entites: [HomeEntity] = [HomeEntity]()
    
    init(manager: RequestManager) {
        self.manager = manager
    }
    
    func fetch() {
        
        manager.request { (models, error) in
            
            if let _ = error {
                self.output?.error(with: .serve)
                return
            }
            
            guard let funds = models else {
                self.output?.error(with: .empty)
                return
            }
             
            self.entites = funds.map({ HomeEntityMapper.make(model: $0)})
            self.shoudPagination = self.entites.count > self.limit
            let items = self.getPageItems(page: self.page, allItems: self.entites, maxItemsPerPage: self.limit)
            self.output?.fetched(entites: items)
        }
    }
    
    func getPageItems(page: UInt, allItems: [HomeEntity], maxItemsPerPage: UInt) -> [HomeEntity] {
        let startIndex = Int(page * maxItemsPerPage)
        var length = max(0, allItems.count - startIndex)
        length = min(Int(maxItemsPerPage), length)

        guard length > 0 else { return [] }

        return Array(allItems[startIndex..<(startIndex + length)])
    }
    
    func fetchPaginate() {
         let items = self.getPageItems(page: self.page, allItems: self.entites, maxItemsPerPage: self.limit)
        output?.fetched(paginate: items)
    }
}

enum ErrorType {
    case serve
    case empty
    case network
}
