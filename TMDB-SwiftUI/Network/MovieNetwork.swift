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
        
        Network().callApi(url: url, object: Casts.self) { response in
            switch response {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Details
    func getVideo(movieId: Int, completion: @escaping (Result<VideoResponseModel, Error>) -> ()) {
        let components = URLComponents(string: URL.movieVideo.absoluteString.replacingOccurrences(of: "movie_id",
                                                                                                  with: String(movieId)))
        let url = components?.url?.addApiKey()
        var request = URLRequest(url: url ?? .baseURL)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "Get"
        
        guard let url = url else {
            return
        }
        
        Network().callApi(url: url, object: VideoResponseModel.self) { response in
            switch response {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getImages(movieId: Int) async throws -> ImageResult? {
        let items = [URLQueryItem(name: "api_key", value: "")]
        var components = URLComponents(string: "\(URL.movieImages.absoluteString)/\(movieId)/images")
        components?.queryItems = items
        
        guard let url = components?.url else {
            return nil
        }
        
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<ImageResult, Error>) in
            Network().callApi(url: url, object: ImageResult.self) { response in
                switch response {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
