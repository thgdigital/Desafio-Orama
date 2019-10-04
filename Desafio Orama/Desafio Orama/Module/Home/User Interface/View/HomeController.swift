//
//  ViewController.swift
//  Desafio Orama
//
//  Created by THIAGO on 03/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
    
    var presenter: HomePresenterInput!
    var loadingView = LoadingView.instanceFromNib()
    
    var items: [HomeItem] = [HomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialLayout()
        
        presenter.viewDidLoad()
    }
    
    fileprivate func initialLayout() {
        let nibName = UINib(nibName: "FundCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: FundCell.identifier)
        let nibNameLoading = UINib(nibName: "LoadingCell", bundle:nil)
        collectionView.register(nibNameLoading, forCellWithReuseIdentifier: LoadingCell.identifier)
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        view.addSubview(loadingView)
        loadingView.isHidden = true
        NSLayoutConstraint.activate([
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            loadingView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
}

extension HomeController: HomePresenterOutput {
    
    func fetched(items: [HomeItem]) {
        self.items = items
        collectionView.reloadData()
    }
    
    func fetched(paginate items: [HomeItem]) {
        self.items = items
        collectionView.reloadItemsInSection(sectionIndex: 0, newCount: self.items.count) {
            let indexPathsForVisibleItems = self.collectionView.indexPathsForVisibleItems
            if !self.presenter.finishPagination {
                self.collectionView.reloadItems(at: indexPathsForVisibleItems)
            }
        }
    }
    
    func stopLoading() {
        collectionView.isHidden = false
        loadingView.isHidden = true
    }
    
    func loading() {
        loadingView.isHidden = false
    }
    
    func setupLayout(title: String) {
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        self.title = title
        
    }
}
extension HomeController:  UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        if items[indexPath.row] is LoadingItem {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCell.identifier, for: indexPath) as! LoadingCell
            return  cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FundCell.identifier, for: indexPath) as! FundCell
            
            let color: UIColor = indexPath.row % 2 == 0 ? primaryColor : secondaryColor
            
            cell.poppulate(display: HomeDisplayMapper.make(item: item), color:color )
            cell.shadowDecorate()
            return  cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if items[indexPath.row] is LoadingItem, presenter.finishPagination  {
            return .zero
        }
        
        let height = view.frame.height / 6
        return CGSize(width: view.frame.width - CGFloat(20), height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if cell is LoadingCell, !presenter.finishPagination {
            presenter.paginate()
        }
    }
    
}
