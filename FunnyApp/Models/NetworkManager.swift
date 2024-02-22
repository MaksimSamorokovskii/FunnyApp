//
//  NetworkManager.swift
//  FunnyApp
//
//  Created by Максим Самороковский on 19.02.2024.
//

import Foundation

struct NetworkManager {
    static func fetchMemes(completion: @escaping (Result<[Meme], Error>) -> Void) {
        guard let url = URL(string: "https://api.imgflip.com/get_memes") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NetworkError.unknown))
                }
                
                return
            }
            
            do {
                let welcome = try JSONDecoder().decode(Welsome.self, from: data)
                completion(.success(welcome.data.memes))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case unknown
}
