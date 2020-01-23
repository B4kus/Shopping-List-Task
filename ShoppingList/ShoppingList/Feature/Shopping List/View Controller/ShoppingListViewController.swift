//
//  ShoppingListViewController.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 18/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import UIKit

final class ShoppingListViewController: UIViewController, ViewConfigurable {
    
    // MARK: - Views
    
    typealias ContentViewType = ShoppingListView
    
    // MARK: - Properties
    
    private let viewModel: ShoppingListViewModel
    
    // MARK: - Initalization
    
    init(viewModel: ShoppingListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupNavigationBar()
        setupTableView()
        
    }
    
    override func loadView() {
        super.loadView()
        loadContentView()
    }
    
    private func setupTableView() {
        contentView.shoopingListTableView.dataSource = self
    }
    
    private func setupBinding() {
        viewModel.sumUpDidChange = { [weak self] viewModel in
            self?.contentView.sumupView.bind(viewModel)
        }
        
        viewModel.exchangeRateDownloadError = { [weak self] error in
            self?.showAlert(withTitle: "Error", message: "\(error)")
        }
        
        viewModel.loadData() { [weak self] in
            self?.contentView.shoopingListTableView.reloadData()
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Shopping list 🛒"
        navigationItem.setRightBarButton(.init(title: "Currency", style: .done, target: self, action: #selector(navigateToExchnageRateViewController)), animated: true)
    }
    
    @objc func navigateToExchnageRateViewController() {
        let viewModel = ExchangeRateViewModel()
        let exchangeRateViewController = ExchnageRateViewController(viewModel: viewModel)
        exchangeRateViewController.rowSelected = { [weak self ] updatedExchangeRateModel in
            guard let self = self else { return }
            self.viewModel.updateExchangeRateModel(updatedExchangeRateModel)
        }
        present(exchangeRateViewController, animated: true)
    }
}

extension ShoppingListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseIdentifier, for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        cell.bind(viewModel.productCellViewModels[indexPath.row])
        return cell
    }
}


