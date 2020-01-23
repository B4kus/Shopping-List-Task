//
//  ExchnageRateView.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 18/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import UIKit

final class ExchnageRateView: UIView {
    
    // MARK: - Views
    
    let exchnageRateViewTableView: UITableView = Subviews.exchnageRateViewTableView
    
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
        addSubview(exchnageRateViewTableView)
        exchnageRateViewTableView.activate(constraints: exchnageRateViewTableView.constraints(forEdgeEqualTo: self))
    }
}

private enum Subviews {
    
    static var exchnageRateViewTableView: UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(ExchnageRateViewTableViewCell.self, forCellReuseIdentifier: ExchnageRateViewTableViewCell.reuseIdentifier)
        tableView.allowsSelection = true
        return tableView
    }
}
