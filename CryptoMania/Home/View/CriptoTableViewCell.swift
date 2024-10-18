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
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
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
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
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
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),

            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            symbolLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),

            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            change24hLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 4),
            change24hLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            change24hLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -16)
        ])
    }

    func configure(with cripto: Cripto) {
        nameLabel.text = cripto.name
        symbolLabel.text = cripto.symbol
        priceLabel.text = String(format: "%.2f", cripto.quote.usd.price)

        let change24h = cripto.quote.usd.percentChange24h
        change24hLabel.text = String(format: "24h: %.2f%%", change24h)
        change24hLabel.textColor = change24h >= 0 ? .systemGreen : .systemRed

        if let imageURL = URL(string: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(cripto.id).png") {
            iconImageView.sd_setImage(with: imageURL)
        }
    }
}
