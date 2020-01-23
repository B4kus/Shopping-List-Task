//
//  SumupView.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 21/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import UIKit

final class SumupView: UIView {
    
    // MARK: - Views

    private let amountToPay: UILabel = Subviews.amountToPay
    private let currencyLabel: UILabel = Subviews.currencyLabel
    
    // MARK: - Properties
    
    private weak var viewModel: SumUpViewModel?
    
    // MARK: - Initalization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupSelf()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupSelf() {
        backgroundColor = .red
    }
    
    private func setupLayout() {
        addSubview(amountToPay)
        amountToPay.activate(constraints: [
            amountToPay.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutInsets.large),
            amountToPay.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        addSubview(currencyLabel)
        currencyLabel.activate(constraints: [
            currencyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutInsets.large),
            currencyLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func bind(_ viewModel: SumUpViewModel) {
        self.viewModel = viewModel
        amountToPay.text = "\(viewModel.sumupValue)"
        currencyLabel.text = viewModel.currency
    }
}

private enum Subviews {
    
    static var amountToPay: UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: LayoutInsets.Font.large)
        return label
    }
    
    static var currencyLabel: UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: LayoutInsets.Font.large )
        return label
    }
}
