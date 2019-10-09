//
//  FundCell.swift
//  Desafio Orama
//
//  Created by THIAGO on 04/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class FundCell: UICollectionViewCell {
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var borderView: UIView!
    

    func poppulate(display: FundDisplay, color: UIColor) {
        borderView.backgroundColor = color
        titleLabel.text = display.name
        currencyLabel.text = display.currency
        percentLabel.text = display.riskProfile
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        currencyLabel.text = ""
        percentLabel.text = ""
    }
}
