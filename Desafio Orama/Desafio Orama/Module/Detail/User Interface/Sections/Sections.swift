//
//  Sections.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class Sections {
    
    var item: Any
    
    init(item: Any) {
        self.item = item
    }
    
    var cellsSize: [String: CGSize] = [:]
    
    func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {}
    
    func didEndDisplayingCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {}
    
    func string(for cell: CollectionViewCell.Type, from indexPath: IndexPath) -> String {
        return "\(indexPath.section)-\(cell.identifier)"
    }
    
    func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        return cellsSize[string(for: cell, from: indexPath)] ?? .zero
    }
    
    func setCell(_ cell: CollectionViewCell.Type, size: CGSize, for indexPath: IndexPath) {
        cellsSize[string(for: cell, from: indexPath)] = size
    }
    
    func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        return CollectionViewCell.self
    }
    
    func cellWidth(collectionWidth: CGFloat) -> CGFloat {
        return collectionWidth
    }
    
}
