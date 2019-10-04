//
//  HomeEntityMapper.swift
//  Desafio Orama
//
//  Created by THIAGO on 03/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class HomeEntityMapper {
    
    static func make(model: FundModelElement) -> HomeEntity {
        let entity = HomeEntity()
        entity.fullName = model.fullName
        entity.simpleName = model.simpleName
        entity.fundRiskProfile = model.specification.fundRiskProfile.name.rawValue
        entity.initialDate = model.initialDate
        entity.minimumInitialApplicationAmount = model.operability.minimumInitialApplicationAmount
        if let thumbnail = model.strategyVideo?.thumbnail {
            entity.thumbnailVideo = thumbnail
        }
       
        return entity
    }
    
    static func make(entity: HomeEntity) -> HomeItem {
        let item = HomeItem()
        item.fullName = entity.fullName
        item.simpleName = entity.simpleName
        item.fundRiskProfile = entity.fundRiskProfile
        item.initialDate = entity.initialDate
        item.minimumInitialApplicationAmount = entity.minimumInitialApplicationAmount
        item.thumbnailVideo = entity.thumbnailVideo
        return item
    }
}
