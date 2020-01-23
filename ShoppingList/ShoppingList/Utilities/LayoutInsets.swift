//
//  LayoutInsets.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 18/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import UIKit

enum LayoutInsets {
    static var small: CGFloat { return 4.0 }
    static var medium: CGFloat { return 8.0 }
    static var normal: CGFloat { return 12.0 }
    static var large: CGFloat { return 16.0 }
    static var huge: CGFloat { return 20.0 }
    
    enum Font {
        static var small: CGFloat { return 14.0 }
        static var normal: CGFloat { return 16.0 }
        static var large: CGFloat { return 20.0 }
    }
}

extension CGFloat {
    
    var half: CGFloat {
        return self * 0.5
    }
}
