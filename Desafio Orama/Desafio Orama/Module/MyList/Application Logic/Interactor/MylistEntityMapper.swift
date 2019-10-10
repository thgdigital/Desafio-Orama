//
//  MylistEntityMapper.swift
//  Desafio Orama
//
//  Created by THIAGO on 10/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class MylistEntityMapper {
    static func make(model: Fund) -> MylistEntity {
        
        let entity = MylistEntity()
        
        if let descriptionManager = model.descriptionManager {
              entity.descriptionManager = descriptionManager
        }
        
        if let fullName = model.fullName {
            entity.fullName = fullName
        }
        
        if let fundRiskProfile = model.fundRiskProfile {
            entity.fundRiskProfile = fundRiskProfile
        }
        if let initialDate = model.initialDate {
            entity.initialDate = initialDate
        }
        
        if let minimumInitialApplicationAmount = model.minimumInitialApplicationAmount {
            entity.minimumInitialApplicationAmount = minimumInitialApplicationAmount
        }
        
        if let simpleName = model.simpleName {
            entity.simpleName = simpleName
        }
        
        if let thumbnailVideo = model.thumbnailVideo {
            entity.thumbnailVideo = thumbnailVideo
        }
      
        return entity
    }
    
    static func make(entity: MylistEntity) -> FundItem {
           let item = FundItem()
           item.fullName = entity.fullName
           item.simpleName = entity.simpleName
           item.fundRiskProfile = entity.fundRiskProfile
           item.initialDate = entity.initialDate
           item.minimumInitialApplicationAmount = entity.minimumInitialApplicationAmount
           item.thumbnailVideo = entity.thumbnailVideo
           item.urlVideo = entity.urlVideo
           item.descriptionManager = entity.descriptionManager
           return item
       }
    
}
