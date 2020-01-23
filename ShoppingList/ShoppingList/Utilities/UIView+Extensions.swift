//
//  UIView+Extensions.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 18/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import UIKit

extension UIView  {
    
    func activate(constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func constraints(forEdgeEqualTo view: UIView, inset: CGFloat = 0.0) -> [NSLayoutConstraint] {
        return [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            topAnchor.constraint(equalTo: view.topAnchor, constant: inset),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset)
        ]
    }
}
