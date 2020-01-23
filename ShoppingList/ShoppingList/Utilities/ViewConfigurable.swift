//
//  ViewConfigurable.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 18/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import UIKit

typealias ViewConfigurable = ViewContainable & ViewLoadable

protocol ViewContainable {
    associatedtype ContentViewType: UIView
    var contentView: ContentViewType { get }
}

extension ViewContainable where Self: UIViewController {
    var contentView: ContentViewType {
        guard let view = view as? ContentViewType else { return ContentViewType() }
        return view
    }
}

protocol ViewLoadable {
    associatedtype ContentViewType: UIView
    func loadContentView()
}

extension ViewLoadable where Self: UIViewController {
    func loadContentView() {
        view = ContentViewType()
    }
}
