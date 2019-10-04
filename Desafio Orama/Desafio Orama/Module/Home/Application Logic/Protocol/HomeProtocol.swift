//
//  HomeProtocol.swift
//  Desafio Orama
//
//  Created by THIAGO on 03/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

protocol HomePresenterInput {
    func viewDidLoad()
    func refresh()
    func paginate()
}

protocol HomePresenterOutput: class {
    func setupLayout(title: String)
    func fetched(items: [HomeItem])
    func fetched(paginate items: [HomeItem])
    func loading()
    func stopLoading()

}

protocol HomeInteractorInput {
    var entites: [HomeEntity] { get set }
    var shoudPagination: Bool { get set }
    var page: UInt { get set }
    func fetch()
    func fetchPaginate()
    
}

protocol HomeInteractorOutput: class {
    func fetched(entites: [HomeEntity])
    func fetched(paginate items: [HomeEntity])
    func error(with error: ErrorType)
}
