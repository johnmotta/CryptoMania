//
//  LoginScreen.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import UIKit

protocol LoginScreenDelegate: AnyObject {
    func didTapLoginButton()
    func didTapRegisterButton()
}

class LoginScreen: UIView {
    
    weak var delegate: LoginScreenDelegate?
    
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let comunityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.text = "Junte-se à comunidade"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Vamos conhecer todas as criptomoedas do mercado e seguir as que mais gostamos! Você não quer perder a oportunidade de comprar uma boa cripto."
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Faça Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(named: "bColor")
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(named: "bColor")
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(registernButtonTapped), for: .touchUpInside)
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
        addSubview(logoImage)
        addSubview(comunityLabel)
        addSubview(descriptionLabel)
        addSubview(loginButton)
        addSubview(registerButton)
    }
    
    private func setConstrants() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 36),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 250),
            logoImage.widthAnchor.constraint(equalToConstant: 250),
            
            comunityLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor),
            comunityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            comunityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            
            descriptionLabel.topAnchor.constraint(equalTo: comunityLabel.bottomAnchor, constant: 32),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            loginButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 8),
            loginButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: -8),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func loginButtonTapped() {
        delegate?.didTapLoginButton()
    }
    
    @objc func registernButtonTapped() {
        delegate?.didTapRegisterButton()
    }
}
