//
//  ExchnageRateViewTableViewCellViewModel.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 21/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import Foundation

protocol ExchnageRateViewTableViewCellViewModelProtocol {
    var currency: String { get }
    var formattedCurrency: String { get }
    var formattedExchangeRate: String { get }
    var exchangeRate: Double { get }
}

final class ExchnageRateViewTableViewCellViewModel: ExchnageRateViewTableViewCellViewModelProtocol {
    
    // MARK: - Properties
    
    private let exchangeRateModel: ExchangeRateModel
    
    var currency: String {
        return exchangeRateModel.exchangeName
    }
    
    var formattedCurrency: String {
        return exchangeRateModel.formattedExchangeName
    }
    
    var formattedExchangeRate: String {
        return "\(exchangeRateModel.exchangeRate.rounded(toPlaces: 2))"
    }
    
    var exchangeRate: Double {
        return exchangeRateModel.exchangeRate
    }
    
    // MARK: - Initalization
    
    init(exchangeRateModel: ExchangeRateModel) {
        self.exchangeRateModel = exchangeRateModel
    }
}
