//
//  SumUpViewModelTest.swift
//  ShoppingListViewModelTests
//
//  Created by Szymon Szysz on 22/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

@testable import ShoppingList
import XCTest

final class SumUpViewModelTest: XCTestCase {
    
    private var systemUnderTests: SumUpViewModel!
    
    override func setUp() {
        let sumupModel: SumupModel = SumupModel(sumupValue: 232.1, currency: "BOA")
        systemUnderTests = SumUpViewModel(sumupModel: sumupModel)
    }
    
    override func tearDown() {
        systemUnderTests = nil
    }
    
    func testViewModelCurrency() {
        // Given
        let currency: String = "BOA"

        // Then
        XCTAssertEqual(currency, systemUnderTests.currency)
    }
    
    func testViewModelsumupValue() {
        // Given
        let sumupValue: Double = 232.1
    
        // Then
        XCTAssertEqual(sumupValue, systemUnderTests.sumupValue)
    }
}
