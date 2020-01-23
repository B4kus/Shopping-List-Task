//
//  ExchangeRateWebService.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 21/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import Foundation

protocol ExchangeRateWebServiceProvider {
    static func getExchnageRateList() -> GetEndpoint<RatesModel>
    static func getExchnageRate(exchange pair: String) -> GetEndpoint<RatesModel>
}

struct ExchangeRateWebService: ExchangeRateWebServiceProvider {

    static func getExchnageRateList() -> GetEndpoint<RatesModel> {
           let prarameters: [String: Any] = ["pairs":"USDBAM,USDEUR,USDCOP,USDBOB,USDBRL,USDCYP,USDUSD"]
           return GetEndpoint(parameters: prarameters)
    }
    static func getExchnageRate(exchange pair: String) -> GetEndpoint<RatesModel> {
        let prarameters: [String: Any] = ["pairs": pair]
        return GetEndpoint(parameters: prarameters)
    }
}

