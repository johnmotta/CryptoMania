//
//  ViewController.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import UIKit

class HomeViewController: UIViewController {

    var homeScreen: HomeScreen?
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}

