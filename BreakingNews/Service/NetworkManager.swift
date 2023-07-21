//
//  NetworkManager.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 21.07.2023.
//

import Foundation

typealias NetworkResult<T: Decodable> = Result<T, NetworkServiceError>
typealias NetworkCompletion<T: Decodable> = (NetworkResult<T>) -> Void

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    private func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping NetworkCompletion<T>) {
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }

            do {
                let decoder = JSONDecoder()
                // Date format özelliği ekleyerek tarih dönüşümünü yapıyoruz.
                //decoder.dateDecodingStrategy = .iso8601
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodingError(error)))
            }
        }

        task.resume()
    }
    //Top headlines
    func getTopHeadlines(country: String, category: String, apiKey: String, completion: @escaping NetworkCompletion<NewsModel>) {
        let endpoint = Endpoint.getTopHeadlines(country: country, category: category, apiKey: apiKey)
        request(endpoint, completion: completion)
    }
    //Everything
    func getEverything(q: String, apiKey: String, completion: @escaping NetworkCompletion<NewsModel>) {
        let endpoint = Endpoint.getEverything(q: q, apiKey: apiKey)
        request(endpoint, completion: completion)
    }
}


