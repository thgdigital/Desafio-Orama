//
//  DetailCell.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class DetailCell: CollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionsLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sendButton.backgroundColor = primaryColor
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.layer.cornerRadius =  sendButton.frame.height / 2
    }
    
    func populate(display: DetailDisplay) {
        titleLabel.text = display.name
        descriptionsLabel.text = display.descriptionManager
        dateLabel.text = display.date
    }
}
