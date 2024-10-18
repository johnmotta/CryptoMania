//
//  CriptomoedaTableViewCell.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import UIKit
import SDWebImage

class CriptoTableViewCell: UITableViewCell {

    static let identifier = String(describing: CriptoTableViewCell.self)
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 1
        return label
    }()

    private lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .right
        return label
    }()

    private lazy var change24hLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var volume24hLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var marketCapLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var favButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemRed
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addElements() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(change24hLabel)
        contentView.addSubview(favButton)
        contentView.addSubview(volume24hLabel)
        contentView.addSubview(marketCapLabel)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            iconImageView.widthAnchor.constraint(equalToConstant: 60),

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),

            symbolLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            symbolLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            change24hLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            change24hLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            volume24hLabel.topAnchor.constraint(equalTo: change24hLabel.bottomAnchor, constant: 4),
            volume24hLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            marketCapLabel.topAnchor.constraint(equalTo: volume24hLabel.bottomAnchor, constant: 4),
            marketCapLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            favButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            favButton.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
        ])
    }

    func configure(with cripto: Cripto) {
        nameLabel.text = "\(cripto.name) | "
        symbolLabel.text = cripto.symbol
        priceLabel.text = String(format: "%.2f", cripto.quote.usd.price)

        let change24h = cripto.quote.usd.percentChange24h
        change24hLabel.text = String(format: "Var. 24h: %.2f%%", change24h)
        change24hLabel.textColor = change24h >= 0 ? .systemGreen : .systemRed

        let volume24h = cripto.quote.usd.volume24h
        volume24hLabel.text = String(format: "Vol. 24h: %.2f", volume24h)

        let marketCap = cripto.quote.usd.marketCap
        marketCapLabel.text = String(format: "MCap: %.2f", marketCap)

        if let imageURL = URL(string: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(cripto.id).png") {
            iconImageView.sd_setImage(with: imageURL)
        }
    }
    
    private func numberFormatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }
    
    private func formattedPrice(price: Double) -> String {
        let formattedPrice = numberFormatter().string(from: NSNumber(value: price))
        return formattedPrice ?? "Nulo"
    }
}
