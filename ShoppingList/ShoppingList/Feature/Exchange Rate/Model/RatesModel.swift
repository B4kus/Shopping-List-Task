
//
//  RatesModel.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 23/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import Foundation

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
