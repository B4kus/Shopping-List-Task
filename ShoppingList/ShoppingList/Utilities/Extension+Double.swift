//
//  Extension+Double.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 21/01/2020.
//  Copyright © 2020 Szymon Szysz. All rights reserved.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
