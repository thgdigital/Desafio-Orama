//
//  SectionsThumbnail.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class SectionsThumbnail: Sections {
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let cellVideo = cell as? ThumbnailCell, let itemDetail = item as? DetailItem {
            cellVideo.populate(urlImage: itemDetail.thumbnailVideo)
        }
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        return ThumbnailCell.self
    }
}
