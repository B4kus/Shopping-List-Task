//
//  ProductTableViewCellViewModel.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 21/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import UIKit

final class ProductTableViewCellViewModel {
    
    // MARK: - Properties
    
    private let productModel: Product
    
    var productName: String {
        return productModel.name
    }
    
    var cost: Double {
        return productModel.cost * productModel.amount
    }
    
    var formattedPrice: String {
        return "$ \(productModel.cost)"
    }
    
    var amount: String {
        return "\(Int(productModel.amount))"
    }
    
    var currency: ExchangeRateModel {
        return productModel.currency
    }
    
    var productImage: UIImage {
        return productModel.image
    }
    
    // MARK: - Input
    
    func updateAmount(amount: Double) {
        productModel.amount = amount
        amountChanged?()
    }
     
    func initilizeAmoutChanged(amountChanged: (() -> Void)?) {
        self.amountChanged = amountChanged
    }
     
    var amountChanged: (() -> Void)?
    
    // MARK: - Output
    
    // MARK: - Initalization
    
    init(productModel: Product) {
        self.productModel = productModel
    }
}

