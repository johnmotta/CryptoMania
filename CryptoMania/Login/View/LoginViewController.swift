//
//  LoginViewController.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import UIKit

class LoginViewController: UIViewController {
    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        loginScreen?.delegate = self
    }
}

extension LoginViewController: LoginScreenDelegate {
    func didTapLoginButton() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
