//
//  ThumbnailCell.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit
import SDWebImage

class ThumbnailCell: CollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.masksToBounds = true
    }
    
    func populate(urlImage: String) {
        thumbnailImageView.sd_setImage(with: URL(string: urlImage))
    }

}
