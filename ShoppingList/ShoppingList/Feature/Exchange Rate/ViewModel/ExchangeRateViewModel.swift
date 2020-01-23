//
//  ExchangeRateViewModel.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 18/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import Foundation

final class ExchangeRateViewModel {
    
    // MARK: Properties
    
    var exchnageRateViewTableViewCellViewModel: [ExchnageRateViewTableViewCellViewModel] = []
    
    // MAKR: Dependencies
    
    private let exchangeRateManager: ExchangeRateManaging
    
    // MARK: - Initalization
    
    init(exchangeRateManager: ExchangeRateManaging = ExchangeRateManger()) {
        self.exchangeRateManager = exchangeRateManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(completion: @escaping (HTTPClientError?) -> Void) {
        exchangeRateManager.getExchangeRateList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                let viewModels = model.rates.map { ExchnageRateViewTableViewCellViewModel (exchangeRateModel: $0)}
                self.exchnageRateViewTableViewCellViewModel = viewModels
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
