//
//  ExchnageRateViewController.swift
//  ShoppingList
//
//  Created by Szymon Szysz on 18/12/2019.
//  Copyright © 2019 Szymon Szysz. All rights reserved.
//

import UIKit

final class ExchnageRateViewController: UIViewController, ViewConfigurable {
    
    // MARK: - Views
    
    typealias ContentViewType = ExchnageRateView
    
    // MARK: - Properties
    
    private let viewModel: ExchangeRateViewModel
    var rowSelected: ((_ item: ExchnageRateViewTableViewCellViewModel) -> ())?
    
    // MARK: - Initalization
    
    init(viewModel: ExchangeRateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
    }
    
    override func loadView() {
        super.loadView()
        loadContentView()
    }
    
    // MARK: - Setup
    
    private func setupTableView() {
        contentView.exchnageRateViewTableView.dataSource = self
        contentView.exchnageRateViewTableView.delegate = self
    }
    
    private func setupViewModel() {
        viewModel.loadData { [weak self] error in
            if let error = error {
                self?.showAlert(withTitle: "Error", message: "\(error)")
            } else {
                self?.contentView.exchnageRateViewTableView.reloadData()
            }
        }
    }
}

extension ExchnageRateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.exchnageRateViewTableViewCellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExchnageRateViewTableViewCell.reuseIdentifier, for: indexPath) as? ExchnageRateViewTableViewCell else { return UITableViewCell() }
        cell.bind(viewModel.exchnageRateViewTableViewCellViewModel[indexPath.row])
        return cell
    }
}

extension ExchnageRateViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.exchnageRateViewTableViewCellViewModel[indexPath.row]
        rowSelected?(item)
        dismiss(animated: true, completion: nil)
    }
}
