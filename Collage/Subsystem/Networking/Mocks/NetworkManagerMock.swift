//
//  NetworkManagerMock.swift
//  Collage
//
//  Created by Mohammad Zulqurnain on 07/09/2023.
//

import Combine
import Foundation

class NetworkManagerMock: NetworkManagerDelegate {
    var error: Error? = nil
    let decoder: JSONDecoder = JSONDecoder()
    
    func performRequest<T>(url: URL, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        guard error == nil else {
            return
        }
        if let url = Bundle.main.url(forResource: "hitsList", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            do {
                guard let hitsList = try decoder.decode(PixabayResponse.self, from: data) as? T else {
                    completion(.failure(error!))
                    return }
                completion(.success(hitsList))
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
        }
        return
    }
}
