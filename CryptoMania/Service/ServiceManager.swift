//
//  ServiceManager.swift
//  CryptoMania
//
//  Created by John Motta on 18/10/24.
//

import Foundation

class ServiceManager {
    static let shared = ServiceManager()

    private let cache = URLCache(memoryCapacity: 10 * 1024 * 1024, diskCapacity: 50 * 1024 * 1024, diskPath: nil)

    init() {
        URLCache.shared = cache
    }

    func fetchCoinMarketCap(completion: @escaping (Result<[Cripto], NetworkError>) -> Void) {
        let urlString = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL(urlString)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(Constants.API, forHTTPHeaderField: "X-CMC_PRO_API_KEY")

        if let cachedResponse = cache.cachedResponse(for: request) {
            print("Usando dados do cache")
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(ResponseData.self, from: cachedResponse.data)
                completion(.success(result.data))
            } catch {
                completion(.failure(.decodingError(error)))
            }
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.networkFailure(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.networkFailure(NSError(domain: "Invalid response", code: 0, userInfo: nil))))
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.apiError(httpResponse.statusCode, "API Error")))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            if let response = response {
                let cachedResponse = CachedURLResponse(response: response, data: data)
                self.cache.storeCachedResponse(cachedResponse, for: request)
                print("Armazenando dados no cache")
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(ResponseData.self, from: data)
                completion(.success(result.data))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        task.resume()
    }
}
