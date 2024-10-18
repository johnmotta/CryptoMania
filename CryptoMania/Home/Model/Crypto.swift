//
//  Crypto.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import Foundation

struct ResponseData: Decodable {
    let data: [Cripto]
}

struct Cripto: Decodable {
    let id: Int
    let name: String
    let symbol: String
    let quote: Quote

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, quote
    }
}

struct Quote: Decodable {
    let usd: Usd

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

struct Usd: Decodable {
    let price: Double

    let percentChange24h: Double
    let volume24h: Double
    let marketCap: Double

    enum CodingKeys: String, CodingKey {
        case price, percentChange24h = "percent_change_24h", volume24h = "volume_24h", marketCap = "market_cap"
    }
}
