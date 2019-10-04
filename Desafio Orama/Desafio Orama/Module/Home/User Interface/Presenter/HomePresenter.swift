//
//  HomePresenter.swift
//  Desafio Orama
//
//  Created by THIAGO on 03/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class HomePresenter : HomePresenterInput {

    weak var output: HomePresenterOutput?
    
    var wireframe: HomeWireframe
    
    var interactor: HomeInteractorInput
    
    var items: [HomeItem] = [HomeItem]()
    
    let loadingItem = LoadingItem()
    
    init(interactor: HomeInteractorInput, wireframe: HomeWireframe) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func viewDidLoad() {
        output?.setupLayout(title: "Lista de fundos")
        interactor.fetch()
        output?.loading()
    }
    
    func refresh() {
        interactor.fetch()
    }
    
    func paginate() {
        if items.count < interactor.entites.count {
            interactor.page += 1
            interactor.fetchPaginate()
        }
    }
}

extension HomePresenter: HomeInteractorOutput {
    
    func error(with error: ErrorType) {
        
    }
    
    func fetched(paginate entites: [HomeEntity]) {
        let paginateItems = entites.map({ HomeEntityMapper.make(entity: $0)})
        items.append(contentsOf: paginateItems)
        items = items.filter({ !($0 is LoadingItem) })
        items.append(loadingItem)
        output?.fetched(paginate: items)
    }
    
    func fetched(entites: [HomeEntity]) {
        output?.stopLoading()
        items = entites.map({ HomeEntityMapper.make(entity: $0)})
        items.append(loadingItem)
        output?.fetched(items: items)
        
    }
}
