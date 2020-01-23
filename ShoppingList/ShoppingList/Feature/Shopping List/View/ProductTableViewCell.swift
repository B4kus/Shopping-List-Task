//
//  ShoppingListTableViewCell.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 18/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import UIKit

final class ProductTableViewCell: UITableViewCell {
    
    // MARK: - Views
    
    private let productImage: UIImageView = Subviews.productImage
    private let productName: UILabel = Subviews.productName
    private let counterLabel: UILabel = Subviews.counterLabe
    private let stepperView: UIStepper = Subviews.stepperView
    private let priceLabel: UILabel = Subviews.priceLabel
    
    // MARK: - Properties
    
    private var viewModel: ProductTableViewCellViewModel?
    
    var stepperValueChanged: ((_ value: Double) -> ())?
    
    // MARK: - Initalization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupStepper()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupStepper() {
        stepperView.addTarget(self, action: #selector(stepperValueChange), for: .valueChanged)
    }
    
    private func setupLayout() {
        contentView.addSubview(productImage)
        productImage.activate(constraints: [
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutInsets.large),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutInsets.large),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -LayoutInsets.large),
            productImage.widthAnchor.constraint(equalTo: productImage.heightAnchor)
        ])
        productImage.layer.cornerRadius = productImage.frame.height.half
        
        contentView.addSubview(productName)
        productName.activate(constraints: [
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: LayoutInsets.large),
            productName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutInsets.large),
            productName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -LayoutInsets.large)
        ])
        
        contentView.addSubview(counterLabel)
        counterLabel.activate(constraints: [
            counterLabel.leadingAnchor.constraint(equalTo: productName.trailingAnchor, constant: LayoutInsets.large),
            counterLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutInsets.large),
            counterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -LayoutInsets.large)
        ])
        
        contentView.addSubview(stepperView)
        stepperView.activate(constraints: [
            stepperView.leadingAnchor.constraint(equalTo: counterLabel.trailingAnchor, constant: LayoutInsets.normal),
            stepperView.centerYAnchor.constraint(equalTo: counterLabel.centerYAnchor)
        ])
        contentView.addSubview(priceLabel)
        priceLabel.activate(constraints: [
            priceLabel.leadingAnchor.constraint(equalTo: stepperView.trailingAnchor, constant: LayoutInsets.normal),
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutInsets.large),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -LayoutInsets.large),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutInsets.large)
        ])
    }
    
    @objc private func stepperValueChange() {
        stepperValueChanged?(stepperView.value)
    }
    
    func bind(_ viewModel: ProductTableViewCellViewModel) {
        self.viewModel = viewModel
        productName.text = viewModel.productName
        priceLabel.text = viewModel.formattedPrice
        counterLabel.text = viewModel.amount
        productImage.image = viewModel.productImage
        stepperValueChanged = { [weak self] value in
            guard let self = self else { return }
            self.viewModel?.updateAmount(amount: value)
            self.counterLabel.text = "\(Int(value))"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
    }
}

private enum Subviews {
    
    static var productImage: UIImageView {
        let imageView = UIImageView()
        return imageView
    }
    
    static var productName: UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: LayoutInsets.Font.large)
        return label
    }
    
    static var counterLabe: UILabel {
        let label = UILabel()
        return label
    }
    
    static var stepperView: UIStepper {
        let stepper = UIStepper()
        stepper.stepValue = 1
        return stepper
    }
    
    static var priceLabel: UILabel {
        let label = UILabel()
        return label
    }
}
