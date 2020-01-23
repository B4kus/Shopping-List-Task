//
//  ProductTableViewCellViewModelTest.swift
//  ShoppingListViewModelTests
//
//  Created by Szymon Szysz on 22/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

@testable import ShoppingList
import XCTest

final class ProductTableViewCellViewModelTest: XCTestCase {
    
    private var systemUnderTests: ProductTableViewCellViewModel!
    
    override func setUp() {
        let productModel: Product = Product(name: "USDUSD", cost: 2.4, amount: 0, currency: ExchangeRateModel(exchangeName: "USDUSD", exchangeRate: 2.1, timestamp: Date().timeIntervalSince1970), image: #imageLiteral(resourceName: "food-and-restaurant"))
        systemUnderTests = ProductTableViewCellViewModel(productModel: productModel)
    }
    
    override func tearDown() {
        systemUnderTests = nil
    }
    
    func testViewModelCalculationLogic() {
        // Given
        let amount: String = "1"
        
        // When
        systemUnderTests.updateAmount(amount: 1.0)

        // Then
        XCTAssertEqual(amount,systemUnderTests.amount)
        
    }
    
    func testViewModelFormattPrice() {
        // Given
        let amount: String = "$ 2.4"
        
        // Then
        XCTAssertEqual(amount,systemUnderTests.formattedPrice)

    }
    
    func testViewModelCostCalculation() {
        // Given
        let cost: Double = 2.4
        
        // When
        systemUnderTests.updateAmount(amount: 1.0)
        
        // Then
        XCTAssertEqual(cost,systemUnderTests.cost)
    }
    
    func testViewModelCurrency() {
        // Given
        let currency: ExchangeRateModel = ExchangeRateModel(exchangeName: "USDUSD", exchangeRate: 2.1, timestamp: Date().timeIntervalSince1970)
        
        // Then
        XCTAssertEqual(currency, systemUnderTests.currency)
    }
    
    func testViewProductImage() {
        // Given
        let image: UIImage = #imageLiteral(resourceName: "food-and-restaurant")
        
        // Then
        XCTAssertEqual(image, systemUnderTests.productImage)
    }
    
}
