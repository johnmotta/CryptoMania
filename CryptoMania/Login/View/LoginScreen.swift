//
//  LoginScreen.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import UIKit

protocol LoginScreenDelegate: AnyObject {
    func didTapLoginButton()
}

class LoginScreen: UIView {
    
    weak var delegate: LoginScreenDelegate?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "CryptoMania"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Vamos conhecer todas as criptomoedas do mercado e seguir as que mais gostamos! Você não quer perder a oportunidade de comprar uma boa cripto."
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Faça Login", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        setConstrants()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(loginButton)
    }
    
    private func setConstrants() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            loginButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 8),
            loginButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: -8),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func loginButtonTapped() {
        delegate?.didTapLoginButton()
    }
}
