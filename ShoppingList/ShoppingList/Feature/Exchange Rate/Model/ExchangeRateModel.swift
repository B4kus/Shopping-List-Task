//
//  ExchangeRateModel.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 20/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import Foundation

struct ExchangeRateModel: Equatable {
    
    // MARK: Properties
    
    var exchangeName: String
    var exchangeRate: Double
    var timestamp: Double
    
    var formattedRate: String {
        return "\(exchangeRate.rounded(toPlaces: 2))"
    }
    
    var formattedExchangeName: String{
        return "\(exchangeName.dropFirst(3))"
    }
    
    init(exchangeName: String,
         exchangeRate: Double,
         timestamp: Double) {
        self.exchangeName = exchangeName
        self.exchangeRate = exchangeRate
        self.timestamp = timestamp
    }
    
    init(exchangeRate: ExchangeRate ) {
        self.exchangeName = "USD"
        self.exchangeRate = exchangeRate.rate
        self.timestamp = exchangeRate.timestamp
    }
    
     static func == (lhs: ExchangeRateModel, rhs: ExchangeRateModel) -> Bool {
           return lhs.exchangeName == rhs.exchangeName
    }
}
