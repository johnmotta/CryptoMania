//
//  FavoriteViewController.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var viewModel: HomeViewModel
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CriptoTableViewCell.self, forCellReuseIdentifier: CriptoTableViewCell.identifier)
        return tableView
    }()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.filterFav()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favCrypto?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CriptoTableViewCell.identifier, for: indexPath) as? CriptoTableViewCell else {
            return UITableViewCell()
        }
        
        guard let cripto = viewModel.favCrypto?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configure(with: cripto, isFavorite: cripto.favorite ?? false)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
