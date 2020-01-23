//
//  SumUpViewModel.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 22/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import Foundation

struct SumupModel {
    let sumupValue: Double
    let currency: String
    
    init(sumupValue: Double, currency: String) {
        self.sumupValue = sumupValue
        self.currency = currency
    }
}

final class SumUpViewModel {

    // MARK: - Properties
    
    private let sumupModel: SumupModel
    
    var currency: String {
        return sumupModel.currency
    }
    
    var sumupValue: Double {
        return sumupModel.sumupValue
    }
    
    // MARK: - Initalization
    
    init(sumupModel: SumupModel) {
        self.sumupModel = sumupModel
    }
}




