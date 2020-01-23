//
//  ExchangeRateModel.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 20/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import Foundation

struct ExchangeRate: Decodable {
    
    // MARK: Properties
    
    let rate: Double
    let timestamp: Double
    
    // MARK: CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case rate
        case timestamp
    }
    
    // MARK: Decode
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rate = try container.decode(Double.self, forKey: .rate)
        timestamp = try container.decode(Double.self, forKey: .timestamp)
    }
}

class ExchangeRateModel: Equatable {
    
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

struct RatesModel: Decodable {
    
    // MARK: Properties
    
    let rates: [ExchangeRateModel]
    
    // MARK: CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case rates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dic = try container.decode([String: ExchangeRate].self, forKey: .rates)
        rates = dic.compactMap { ExchangeRateModel(exchangeName: $0.key, exchangeRate: $0.value.rate, timestamp: $0.value.timestamp) }
    }
}



