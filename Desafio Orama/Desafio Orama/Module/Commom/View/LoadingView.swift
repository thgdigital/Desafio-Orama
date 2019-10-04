//
//  LoadingView.swift
//  Desafio Orama
//
//  Created by THIAGO on 04/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
