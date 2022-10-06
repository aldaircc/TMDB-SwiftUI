//
//  VideoNetwork.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 2/10/22.
//

import Foundation

protocol VideoRequestProtocol {
    func getVideo(movieId: Int, completion: @escaping (Result<VideoResponseModel, Error>) -> ())
}

struct VideoNetwork: VideoRequestProtocol {
    func getVideo(movieId: Int, completion: @escaping (Result<VideoResponseModel, Error>) -> ()) {
        let components = URLComponents(string: URL.movieVideo.absoluteString.replacingOccurrences(of: "movie_id", with: String(movieId)))
        
        guard let url = components?.url?.addApiKey() else {
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "Get"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(URLError.init(.badServerResponse)))
                return
            }
            
            if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                guard let decoded = try? JSONDecoder().decode(VideoResponseModel.self, from: data) else {
                    return
                }
                
                completion(.success(decoded))
            } else {
                completion(.failure(URLError.init(.zeroByteResource)))
            }
        }.resume()
    }
}
