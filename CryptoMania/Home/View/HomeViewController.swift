//
//  ViewController.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import UIKit

class HomeViewController: UIViewController {

    var homeScreen: HomeScreen?
    var homeViewModel = HomeViewModel()

    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        homeScreen?.tableView.dataSource = self
        homeScreen?.tableView.delegate = self
        
        homeViewModel.fetchData()

        homeViewModel.didFetchData = { [weak self] in
            DispatchQueue.main.async {
                self?.homeScreen?.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.crypto?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CriptoTableViewCell.identifier, for: indexPath) as? CriptoTableViewCell,
              let criptomoeda = homeViewModel.crypto?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configure(with: criptomoeda)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
