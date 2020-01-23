//
//  ExchangeRateViewModelTest.swift
//  ShoppingListViewModelTests
//
//  Created by Szymon Szysz on 23/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

@testable import ShoppingList
import XCTest

final class ExchangeRateViewModelTest: XCTestCase {
    
    private var systemUnderTests: ExchangeRateViewModel!
    
    override func setUp() {
        systemUnderTests = ExchangeRateViewModel()
    }
    
    override func tearDown() {
        systemUnderTests = nil
    }
    
    func testHttpRequest200() {
        // Given
        let promise = expectation(description: "200")
        
        // When
        systemUnderTests.loadData { error in
            guard let error = error else { promise.fulfill(); return }
            XCTFail("\(error)")
        }
        
        // Then
        wait(for: [promise], timeout: 5)
    }
}

