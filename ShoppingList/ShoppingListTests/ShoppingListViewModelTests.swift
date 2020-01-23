//
//  ShoppingListViewModelTests.swift
//  ShoppingListViewModelTests
//
//  Created by Szymon Szysz on 22/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

@testable import ShoppingList
import XCTest

final class ShoppingListViewModelTests: XCTestCase {
    
    private var systemUnderTests: ShoppingListViewModel!
    
    override func setUp() {
       systemUnderTests = ShoppingListViewModel()
    }

    override func tearDown() {
        systemUnderTests = nil
    }

    func testViewModelCalculationLogic() {
        // Given
        systemUnderTests.loadData{}
        
        // When
        systemUnderTests.productCellViewModels.first?.amountChanged?()
        systemUnderTests.productCellViewModels.first?.amountChanged?()
        systemUnderTests.productCellViewModels.first?.amountChanged?()
        
        // Then
        systemUnderTests.sumUpDidChange = { model in
            XCTAssertEqual(1.9,model.sumupValue)
        }
    }
}
