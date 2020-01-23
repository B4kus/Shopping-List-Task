//
//  ShoppingListView.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 18/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import UIKit

final class ShoppingListView: UIView {
    
    // MARK: - Views
    
    let shoopingListTableView: UITableView = Subviews.shoopingListTableView
    let sumupView: SumupView = Subviews.sumupView
    
    // MARK: - Properties
    
    private static var sumupViewHeight: CGFloat = 80.0
    
    // MARK: - Initalization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupLayout() {
        addSubview(shoopingListTableView)
        shoopingListTableView.activate(constraints: [
            shoopingListTableView.topAnchor.constraint(equalTo: topAnchor),
            shoopingListTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shoopingListTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        addSubview(sumupView)
        sumupView.activate(constraints: [
            sumupView.topAnchor.constraint(equalTo: shoopingListTableView.bottomAnchor),
            sumupView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sumupView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sumupView.bottomAnchor.constraint(equalTo: bottomAnchor),
            sumupView.heightAnchor.constraint(equalToConstant: ShoppingListView.sumupViewHeight)
        ])
    }
}

private enum Subviews {
    
    static var shoopingListTableView: UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.reuseIdentifier)
        tableView.allowsSelection = false
        return tableView
    }
    
    static var sumupView: SumupView {
        let sumupView = SumupView()
        return sumupView
    }
}
