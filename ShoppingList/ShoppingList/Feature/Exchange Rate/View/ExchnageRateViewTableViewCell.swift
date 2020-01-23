//
//  ExchnageRateViewTableViewCell.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 18/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import UIKit

final class ExchnageRateViewTableViewCell: UITableViewCell {
    
    // MARK: - Views
    
    let currencyLabel: UILabel = Subviews.currencyLabel
    let currencyRate: UILabel = Subviews.currencyRate
    
    // MARK: - Properties
    
    private var viewModel: ExchnageRateViewTableViewCellViewModel?
    static var cellHeight: CGFloat = 60.0
    
    
    // MARK: - Initalization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupLayout() {
        contentView.addSubview(currencyLabel)
        currencyLabel.activate(constraints: [
            currencyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutInsets.large),
            currencyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutInsets.large),
            currencyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -LayoutInsets.large)
        ])
        
        contentView.addSubview(currencyRate)
        currencyRate.activate(constraints: [
            currencyRate.leadingAnchor.constraint(equalTo: currencyLabel.trailingAnchor, constant: LayoutInsets.large),
            currencyRate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutInsets.large),
            currencyRate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutInsets.large),
            currencyRate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -LayoutInsets.large)
        ])
    }
    
    func bind(_ viewModel: ExchnageRateViewTableViewCellViewModel) {
        self.viewModel = viewModel
        currencyLabel.text = viewModel.formattedCurrency
        currencyRate.text = viewModel.formattedExchangeRate
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
    }
}

private enum Subviews {

    static var currencyLabel: UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: LayoutInsets.Font.large)
        return label
    }
    
    static var currencyRate: UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: LayoutInsets.Font.normal)
        return label
    }
}

