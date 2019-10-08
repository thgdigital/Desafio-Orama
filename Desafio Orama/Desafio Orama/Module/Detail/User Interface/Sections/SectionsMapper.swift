//
//  SectionsMapper.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class SectionsMapper {
    
    static func make(item: DetailItem) -> [Sections] {
        var sections = [Sections]()
        
        if !item.thumbnailVideo.isEmpty {
            sections.append(SectionsThumbnail(item: item))
        }
        
        
        let loginInteractor = LoginInteractor()
        
        sections.append(DescriptionsSections(interactor: loginInteractor, item: item))
        
        return sections
    }
}
