//
//  DetailController.swift
//  Desafio Orama
//
//  Created by THIAGO on 06/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var presenter: DetailPresenterInput!
    
    var sections: [Sections] = [Sections]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        presenter.viewDidLoad()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.row]
        let identifier = section.cell(for: indexPath).identifier
        
        registerCell(section, collectionView: collectionView, at: indexPath)
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    
    fileprivate func registerCell(_ section: Sections, collectionView: UICollectionView, at indexPath: IndexPath) {
        let cellClass = section.cell(for: indexPath)
        collectionView.register(cellClass, forCellWithReuseIdentifier: cellClass.identifier)
        
        let nibName = UINib(nibName: cellClass.identifier, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: cellClass.identifier)
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = sections[indexPath.row]
        
        registerCell(section, collectionView: collectionView, at: indexPath)
        
        let cellType = section.cell(for: indexPath)
        
        var sizeCell = section.getCellSize(cellType, for: indexPath)
        
        if sizeCell == .zero, let cell = section.cell(for: indexPath).fromNib() {
            cell.prepareForReuse()
            section.willDisplayCell(cell, at: indexPath)
            cell.cellWidthConstraint?.constant = section.cellWidth(collectionWidth: collectionView.frame.width)
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            sizeCell = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            section.setCell(cellType, size: sizeCell, for: indexPath)
        }
        return sizeCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let section = sections[indexPath.row]
        if let cell = cell as? CollectionViewCell {
            section.willDisplayCell(cell, at: indexPath)
            cell.cellWidthConstraint?.constant = section.cellWidth(collectionWidth: collectionView.frame.width)
        }
    }
}

extension DetailController: DetailPresenterOuput {
    func createSections(sections: [Sections]) {
        self.sections = sections
        collectionView.reloadData()
    }
    
    func createLayout(title: String) {
        self.title = title
    }
    
}
