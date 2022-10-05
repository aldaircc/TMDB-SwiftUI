//
//  VideoNetwork.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 2/10/22.
//

import Foundation

protocol VideoRequestProtocol {
    func getVideo(movieId: Int)
}

struct VideoNetwork: VideoRequestProtocol {
    func getVideo(movieId: Int) {
        let components = URLComponents(string: URL.movieVideo.absoluteString.replacingOccurrences(of: "movie_id", with: String(movieId)))
        
        guard let url = components?.url?.addApiKey() else {
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "Get"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse else {
                print(error?.localizedDescription)
                return
            }
            
            if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                print("Good job", data)
            } else {
                print("There was an error, statusCode: \(httpResponse.statusCode)")
            }
            
            return
        }.resume()
    }
}
