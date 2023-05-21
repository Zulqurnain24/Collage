//
//  NetworkManager.swift
//  Collage
//
//  Created by Muhammad Zulqurnain on 21/05/2023.
//

import Foundation

class NetworkManager {
    func performRequest<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = NSError(domain: "NetworkError", code: -1, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            guard 200..<300 ~= httpResponse.statusCode else {
                let error = NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data ?? Data())
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
