//
//  DetailItem.swift
//  Desafio Orama
//
//  Created by THIAGO on 06/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class DetailItem {
    var simpleName: String = ""
    var initialDate: String = ""
    var fullName: String = ""
    var minimumInitialApplicationAmount: String = ""
    var fundRiskProfile: String = ""
    var thumbnailVideo: String = ""
    var urlVideo: String = ""
    var descriptionManager: String = ""
    
    init() {}
    
    init(homeItem: FundItem) {
        self.fullName = homeItem.fullName
        self.fundRiskProfile = homeItem.fundRiskProfile
        self.initialDate = homeItem.initialDate
        self.minimumInitialApplicationAmount = homeItem.minimumInitialApplicationAmount
        self.simpleName = homeItem.simpleName
        self.thumbnailVideo = homeItem.thumbnailVideo
        self.urlVideo = homeItem.urlVideo
        self.descriptionManager = homeItem.descriptionManager
    }
}
