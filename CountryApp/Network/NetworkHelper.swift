//
//  NetworkHelper.swift
//  CountryApp
//
//  Created by Ulvi Bashirov on 25.02.22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case unableToDecode
    case networkError
}

class NetworkHelper {
    public func fetchRequest<T: Decodable>(endPoint: Endpoints, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: endPoint.path.lowercased().replacingOccurrences(of: " ", with: "%20")) else {
            completion(.failure(.badURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.httpMethod.rawValue
        print(url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.networkError))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    completion(.failure(.networkError))
                }
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(json))
            } catch {
                completion(.failure(.unableToDecode))
            }
        }
        task.resume()
    }
}
