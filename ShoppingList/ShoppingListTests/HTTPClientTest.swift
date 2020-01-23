//
//  HTTPClientTest.swift
//  ShoppingListViewModelTests
//
//  Created by Szymon Szysz on 22/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

@testable import ShoppingList
import XCTest

final class HTTPClientTest: XCTestCase {
    
    private var systemUnderTests: HTTPClient!
    
    override func setUp() {
        systemUnderTests = HTTPClient()
    }
    
    override func tearDown() {
        systemUnderTests = nil
    }
    
    func testHttpRequest200() {
        // Given
        let promise = expectation(description: "200")
        let parameters: [String: Any] = ["pairs":"USDUSD"]
        let path = GetEndpoint<RatesModel>(parameters: parameters)
        
        // When
        systemUnderTests.performRequest(for: path) { result in
            switch result {
            case.success:
                promise.fulfill()
            case .failure(let erorr):
                XCTAssertNil(erorr)
            }
        }
        
        // Then
        wait(for: [promise], timeout: 5)
    }
    
    func testHttpRequestErrorNokey() {
        
        // Given
        let promise = expectation(description: "KeyNotFound")
        let parameters: [String: Any] = ["3423234":"asdsadasasdsa"]
        let path = GetEndpoint<RatesModel>(parameters: parameters)
        
        // When
        systemUnderTests.performRequest(for: path) { result in
            switch result {
            case.success: break
            case .failure(let erorr):
                XCTAssertNotNil(erorr)
                promise.fulfill()
            }
        }
    
        // Then
        wait(for: [promise], timeout: 5)
    }
}
