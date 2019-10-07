//
//  DescriptionsSections.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit


class DescriptionsSections: Sections {
    
    var interactor: LoginInteractorInput
    
    init(interactor: LoginInteractorInput, item: Any) {
        self.interactor = interactor
        super.init(item: item)
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let cellVideo = cell as? DetailCell, let itemDetail = item as? DetailItem {
            cellVideo.delegate = self
            cellVideo.populate(display: DetailDisplay(item: itemDetail))
        }
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        return DetailCell.self
    }
}

extension DescriptionsSections: CollectionViewDelegate {
    
    func didTapCompra() {
        
    }

}
