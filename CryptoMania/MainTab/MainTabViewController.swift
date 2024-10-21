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
        tabBar.tintColor = .label
        navigationItem.hidesBackButton = true

        navigationBarView()
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.image = UIImage(systemName: "bitcoinsign.circle.fill")
        homeVC.title = "CryptoMania"
        

        let favoriteVC = UINavigationController(rootViewController: FavoriteViewController())
        favoriteVC.tabBarItem.image = UIImage(systemName: "star.fill")
        favoriteVC.title = "Favoritos"

        setViewControllers([homeVC, favoriteVC], animated: true)
    }
    
    private func navigationBarView() {
        navigationItem.title = "CryptoMania"
        
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        logoutButton.tintColor = UIColor.systemRed
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    @objc func logoutTapped() {
        navigationController?.popViewController(animated: true)
    }
}
