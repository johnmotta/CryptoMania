//
//  HomeViewModel.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import Foundation

class HomeViewModel {
    var crypto: [Cripto]?
    var favCrypto: [Cripto]?
    var didFetchData: (() -> Void)?


    func fetchData() {
        ServiceManager.shared.fetchCoinMarketCap { result in
            switch result {
            case .success(let crypto):
                DispatchQueue.main.async { [weak self] in
                    self?.crypto = crypto
                    self?.filterFav()
                    self?.didFetchData?()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }

    func filterFav() {
        favCrypto = crypto?.filter { $0.favorite == true }
    }
}
