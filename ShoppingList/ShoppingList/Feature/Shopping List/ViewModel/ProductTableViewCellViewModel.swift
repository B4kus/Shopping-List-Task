//
//  ProductTableViewCellViewModel.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 21/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import UIKit

protocol ProductTableViewCellViewModelProtocol {
    var productName: String { get }
    var cost: Double { get }
    var formattedPrice: String { get }
    var amount: String { get }
    var currency: ExchangeRateModel { get }
    var productImage: UIImage { get }
    
    func updateAmount(amount: Double)
    func initilizeAmoutChanged(amountChanged: (() -> Void)?)
    var amountChanged: (() -> Void)? { get set }
}


final class ProductTableViewCellViewModel: ProductTableViewCellViewModelProtocol {
    
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
    
    // MARK: - Initalization
    
    init(productModel: Product) {
        self.productModel = productModel
    }
}

