//
//  DescriptionsSections.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit


class DescriptionsSections: Sections {
    
    var interactor: LoginInteractorInput
    
    init(interactor: LoginInteractorInput, item: Any) {
        self.interactor = interactor
        super.init(item: item)
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let cellVideo = cell as? DetailCell, let itemDetail = item as? DetailItem {
            cellVideo.delegate = self
            cellVideo.populate(display: DetailDisplay(item: itemDetail))
        }
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        return DetailCell.self
    }
}

extension DescriptionsSections: CollectionViewDelegate {
    
    func didTapCompra() {
        if interactor.isLogged {
            UIAlertController.showAlert(title: "Comprar", message: "Desejar comprar esse produto ?",
                                        cancelButtonTitle: "Cancelar", confirmationButtonTitle: "Comprar",
                                        dismissBlock: { (textField, action) in
                                            
            })
        } else {
            UIAlertController.showAlert(title: "Login", message: "Olá você não esta logado para efetuar há compra desse produto", cancelButtonTitle: "Cancelar", confirmationButtonTitle: "Realizar login", dismissBlock: { (textFields, action) in
                guard let textField = textFields?.first,
                    let emailToSave = textField.text else {
                        return
                }
                guard let textFieldSSN = textFields?[1],
                    let passwordSave = textFieldSSN.text else {
                        return
                }
                self.interactor.save(email: emailToSave, password: passwordSave) { (status) in
                    print("Estou logado? \(status)")
                }
            },    email: { (textField) in
                textField.placeholder = "Digite seu e-mail"
            }) { (textField) in
                textField.placeholder = "Digite sua senha"
            }
        }
    }
}
