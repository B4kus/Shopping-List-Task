//
//  ExchangeRateManager.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 20/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import Foundation

protocol ExchangeRateManaging {
    func getExchangeRateList(completion: @escaping (Result<RatesModel, HTTPClientError>) -> Void) -> Void
    func getExchangeRatePair(exchange pair: String, completion: @escaping (Result<RatesModel, HTTPClientError>) -> Void) -> Void
}

final class ExchangeRateManger: ExchangeRateManaging {
   
    // MARK: Properties
    
    private let http: HTTPClient
    
    init(http: HTTPClient = HTTPClient()) {
        self.http = http
    }
    
    func getExchangeRateList(completion: @escaping (Result<RatesModel, HTTPClientError>) -> Void) -> Void {
        let path = ExchangeRateWebService.getExchnageRateList()
        return http.performRequest(for: path) { result in
            completion(result)
        }
    }
    
    func getExchangeRatePair(exchange pair: String, completion: @escaping (Result<RatesModel, HTTPClientError>) -> Void) {
        let path = ExchangeRateWebService.getExchnageRate(exchange: pair)
        return http.performRequest(for: path) { result in
            completion(result)
        }
    }
}
