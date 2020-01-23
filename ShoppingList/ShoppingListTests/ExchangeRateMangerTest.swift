//
//  ExchangeRateMangerTest.swift
//  ShoppingListViewModelTests
//
//  Created by Szymon Szysz on 23/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

@testable import ShoppingList
import XCTest

final class ExchangeRateMangerTest: XCTestCase {
    
    private var systemUnderTests: ExchangeRateManger!
    
    override func setUp() {
        systemUnderTests = ExchangeRateManger()
    }
    
    override func tearDown() {
        systemUnderTests = nil
    }
    
    func testHttpRequest200() {
        // Given
        let promise = expectation(description: "200")
        
        // When
        systemUnderTests.getExchangeRateList { result in
            switch result {
            case .success(let model):
                XCTAssertNotNil(model)
                promise.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
            }
        }

        // Then
        wait(for: [promise], timeout: 5)
    }
}




