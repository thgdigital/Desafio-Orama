//
//  CollectionViewCell.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellWidthConstraint: NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func fromNib() -> CollectionViewCell? {
        return UINib(nibName: identifier, bundle: nil).instantiate(withOwner: nil, options: nil).first as? CollectionViewCell
    }

}
