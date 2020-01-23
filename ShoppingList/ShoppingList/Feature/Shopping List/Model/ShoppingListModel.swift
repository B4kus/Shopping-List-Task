//
//  ShoppingListModel.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 21/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import UIKit

class Product {
    var name: String
    var cost: Double
    var amount: Double
    var currency: ExchangeRateModel
    var image: UIImage
    
    init(name: String,
         cost: Double,
         amount: Double,
         currency: ExchangeRateModel,
         image: UIImage) {
        self.name = name
        self.cost = cost
        self.amount = amount
        self.currency = currency
        self.image = image
    }
}
