//
//  ViewController.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import UIKit

class HomeViewController: UIViewController {

    var homeScreen: HomeScreen?
    var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false

        homeScreen?.tableView.dataSource = self
        homeScreen?.tableView.delegate = self
        viewModel.fetchData()
        
        viewModel.didFetchData = { [weak self] in
            DispatchQueue.main.async {
                self?.homeScreen?.tableView.reloadData()
            }
        }
    }
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.crypto?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CriptoTableViewCell.identifier, for: indexPath) as? CriptoTableViewCell else {
            return UITableViewCell()
        }
        
        guard let cripto = viewModel.crypto?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.favButtonTapped = { [weak self] in
            guard let self = self else { return }
            
            if self.viewModel.crypto?[indexPath.row].favorite == nil {
                self.viewModel.crypto?[indexPath.row].favorite = false
            }
            
            self.viewModel.crypto?[indexPath.row].favorite?.toggle()
            self.homeScreen?.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        cell.configure(with: cripto, isFavorite: cripto.favorite ?? false)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
