//
//  MainTabView.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        let viewModel = HomeViewModel()
        
        let homeVC = UINavigationController(rootViewController: HomeViewController(viewModel: viewModel))
        homeVC.tabBarItem.image = UIImage(systemName: "bitcoinsign.circle.fill")
        homeVC.title = "CryptoMania"
        
        let favoriteVC = UINavigationController(rootViewController: FavoriteViewController(viewModel: viewModel))
        favoriteVC.tabBarItem.image = UIImage(systemName: "star.fill")
        favoriteVC.title = "Favoritos"

        tabBar.tintColor = UIColor(named: "bColor")
        setViewControllers([homeVC, favoriteVC], animated: true)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "CryptoMania"

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 40),
            logoImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let logoBarButtonItem = UIBarButtonItem(customView: logoImageView)
        navigationItem.leftBarButtonItem = logoBarButtonItem
        
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        logoutButton.tintColor = UIColor.systemRed
        navigationItem.rightBarButtonItem = logoutButton
                
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.isTranslucent = false
    }

    @objc func logoutTapped() {
        navigationController?.popViewController(animated: true)
    }

}
