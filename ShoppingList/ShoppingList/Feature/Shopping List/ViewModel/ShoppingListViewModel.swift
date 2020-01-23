//
//  ShoppingListViewModel.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 18/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import Foundation

final class ShoppingListViewModel {
    
    // MARK: - Properties
    
    private var data: [Product] = [Product(name: "Eggs", cost: 0.95, amount: 0, currency: ExchangeRateModel(exchangeName: "USDUSD", exchangeRate: 1.0, timestamp: 0000), image: #imageLiteral(resourceName: "egg")),
                                   Product(name: "Peas", cost: 2.10, amount: 0, currency: ExchangeRateModel(exchangeName: "USDUSD", exchangeRate: 1.0, timestamp: 0000), image: #imageLiteral(resourceName: "pea")),
                                   Product(name: "Milk", cost: 1.30, amount: 0, currency: ExchangeRateModel(exchangeName: "USDUSD", exchangeRate: 1.0, timestamp: 0000), image: #imageLiteral(resourceName: "milk-2")),
                                   Product(name: "Beans", cost: 0.73, amount: 0, currency: ExchangeRateModel(exchangeName: "USDUSD", exchangeRate: 1.0, timestamp: 0000), image: #imageLiteral(resourceName: "food-and-restaurant"))]
    
    var productCellViewModels: [ProductTableViewCellViewModel] = []
    private var sumUpViewModel: SumUpViewModel? { didSet { checkOut() } }
    private var exchangeRateModel: ExchnageRateViewTableViewCellViewModel? { didSet { checkOut() } }
    
    
    private var timer: Timer?
    
    // MARK: - Dependencies
    
    private let exchangeRateManager: ExchangeRateManaging
    
    init(exchangeRateManager: ExchangeRateManaging = ExchangeRateManger()) {
        self.exchangeRateManager = exchangeRateManager
    }
    
    // MARK: - Input
    var checkOutSum: ((Double) -> Void)?
    var sumUpDidChange: ((SumUpViewModel) -> Void)?
    var exchangeRateDownloadError: ((HTTPClientError) -> Void)?
    
    func loadData(completion: () -> Void?) {
        let fakeResponse: [Product] = data
        let cellViewModels: [ProductTableViewCellViewModel] = fakeResponse
            .map { product -> ProductTableViewCellViewModel in
                let viewModel = ProductTableViewCellViewModel(productModel: product)
                viewModel.initilizeAmoutChanged { [weak self] in
                    DispatchQueue.main.async {
                        self?.checkOut()
                    }
                }
                return viewModel
        }
        productCellViewModels = cellViewModels
        guard let exchangeRateModel = productCellViewModels.first?.currency else { return }
        updateExchangeRateModel(ExchnageRateViewTableViewCellViewModel(exchangeRateModel: exchangeRateModel))
        completion()
    }
    
    func updateExchangeRateModel(_ updatedExchangeRateModel: ExchnageRateViewTableViewCellViewModel) {
        exchangeRateModel = updatedExchangeRateModel
        startTimer()
    }
    
    private func checkOut() {
        var checkOutAmount: Double = 0.0
        productCellViewModels.forEach { checkOutAmount = $0.cost + checkOutAmount }
        guard let exchangeRateModel = exchangeRateModel else { return }
        checkOutAmount = checkOutAmount * exchangeRateModel.exchangeRate
        let roundedValue = checkOutAmount.rounded(toPlaces: 2)
        let model = SumupModel(sumupValue: roundedValue, currency: exchangeRateModel.formattedCurrency)
        let viewModel = SumUpViewModel(sumupModel: model)
        sumUpDidChange?(viewModel)
    }
    
    private func loadCurrentCurrencyData(completion: @escaping (HTTPClientError?) -> Void?) {
        guard let currency = exchangeRateModel?.currency else { return }
        exchangeRateManager.getExchangeRatePair(exchange: currency) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                let viewModel = model.rates.first.map { ExchnageRateViewTableViewCellViewModel(exchangeRateModel: $0) }
                self.exchangeRateModel = viewModel
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true, block: { [weak self] _ in
            self?.loadCurrentCurrencyData(completion: { error in
                guard let error = error else { return () }
                return self?.exchangeRateDownloadError?(error)
            })
        })
    }
}
