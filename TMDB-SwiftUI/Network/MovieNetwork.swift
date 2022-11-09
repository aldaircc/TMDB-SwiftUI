//
//  MovieNetwork.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 7/11/22.
//

import Foundation

struct MovieNetwork {
    
    func getTrendings(_ page: Int, mediaType: MediaType, timeWindow: TimeWindow) async -> TrendingResult? {
        let queryItems = [
            URLQueryItem(name: "api_key", value: ""),
            URLQueryItem(name: "page", value: String(describing: page))
        ]
        
        var components = URLComponents(string: "\(URL.trending.absoluteString)\(mediaType.rawValue)/\(timeWindow)")
        components?.queryItems = queryItems
        
        do {
            let (data, request) = try await URLSession.shared.data(from: components!.url!)
            
            guard let request = request as? HTTPURLResponse else {
                return nil
            }
            
            if request.statusCode >= 200 && request.statusCode < 300 {
                let result = try JSONDecoder().decode(TrendingResult.self, from: data)
                return result
            } else {
                return nil
            }
        } catch {
            print(error)
            return nil
        }
    }
    
    func getCast(_ media: MediaType, id: Int, completion: @escaping (Result<Casts, Error>) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/\(media.rawValue)/\(id)/credits?api_key=") else {
            return
        }
        
        Network().callApi(url: url, object: Casts.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
