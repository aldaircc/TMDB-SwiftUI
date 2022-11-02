//
//  CastNetwork.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 31/10/22.
//

import Foundation

final class CastNetwork {
    
    func getCast(_ media: MediaType, id: Int, completion: @escaping (Result<Casts, Error>) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/\(media.rawValue)/\(id)/credits?api_key=") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  error == nil else {
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let response = try? JSONDecoder().decode(Casts.self, from: data) {
                    completion(.success(response))
                }
            } else {
                
            }
        }
    }
}
