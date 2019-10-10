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
        initialLayout()
        presenter.viewDidLoad()
    }
    
    fileprivate func initialLayout() {
        navigationController?.navigationBar.topItem?.title = "Voltar"
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FundCell.identifier, for: indexPath)

        return cell
    }
}

extension MylistController: MylistPresenterOuput {
    func fetched(items: [FundItem]) {
        self.items = items
        collectionView.reloadData()
    }

}
extension MylistController:  UICollectionViewDelegateFlowLayout {
    
}
