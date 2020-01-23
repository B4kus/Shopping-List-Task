//
//  ExchnageRateViewTableViewCellViewModelTest.swift
//  ShoppingListViewModelTests
//
//  Created by Szymon Szysz on 23/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

@testable import ShoppingList
import XCTest

final class ExchnageRateViewTableViewCellViewModelTest: XCTestCase {
    
    private var systemUnderTests: ExchnageRateViewTableViewCellViewModel!
    
    override func setUp() {
        let model = ExchangeRateModel(exchangeName: "USDUSD", exchangeRate: 2.1, timestamp: Date().timeIntervalSince1970)
        systemUnderTests = ExchnageRateViewTableViewCellViewModel(exchangeRateModel: model)
    }
    
    override func tearDown() {
        systemUnderTests = nil
    }
    
    func testViewModelCalculationLogic() {
        // Given
        let currency: String = "USDUSD"
    
        // Then
        XCTAssertEqual(currency, systemUnderTests.currency)
    }
    
    func testViewModelFormattPrice() {
        // Given
        let exchangeRate: Double = 2.1
        
        // Then
        XCTAssertEqual(exchangeRate, systemUnderTests.exchangeRate)
    }
    
    func testViewModelCostCalculation() {
        // Given
        let formattedCurrency: String = "USD"
                
        // Then
        XCTAssertEqual(formattedCurrency,systemUnderTests.formattedCurrency)
    }
    
    func testViewModelCurrency() {
        // Given
        let exchangeRateFormatted: String = "2.1"
        
        // Then
        XCTAssertEqual(exchangeRateFormatted, systemUnderTests.formattedExchangeRate)
    }
    
}

