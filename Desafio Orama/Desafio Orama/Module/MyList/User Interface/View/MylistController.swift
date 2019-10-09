//
//  MylistController.swift
//  Desafio Orama
//
//  Created by THIAGO on 09/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MylistController: UICollectionViewController {
    
    var presenter: MylistPresenterInput!

    var items: [FundItem] = [FundItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "FundCell", bundle:nil)
          collectionView.register(nibName, forCellWithReuseIdentifier: FundCell.identifier)
          let nibNameLoading = UINib(nibName: "LoadingCell", bundle:nil)
        collectionView.register(nibNameLoading, forCellWithReuseIdentifier: LoadingCell.identifier)

        presenter.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FundCell.identifier, for: indexPath)

        return cell
    }
}

extension MylistController: MylistPresenterOuput {
    func fetched(items: [FundItem]) {
        
    }
    
    
}
extension MylistController:  UICollectionViewDelegateFlowLayout {
    
}
