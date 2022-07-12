//
//  Network.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/07/22.
//

import Foundation

struct Network {
    
    func getGenres(_ language: Languages = .english) async throws {
     
        let queryItems = [
            URLQueryItem(name: "api_key", value: ""),
            URLQueryItem(name: "language", value: language.description)
        ]
        
        var components = URLComponents(string: "\(URL.baseURL.absoluteString)genre/movie/list")
        if !queryItems.isEmpty {
            components?.queryItems = queryItems
        }
        
        guard let finalUrl = components?.url else {
            return
        }
        
        let (data, response) = try await URLSession.shared.data(from: finalUrl)
        
        guard let urlResponse = response as? HTTPURLResponse else {
            return
        }
        
        if urlResponse.statusCode == 200 {
            print("Correct")
            print(data)
        } else {
            print("Status code \(urlResponse.statusCode): \(urlResponse.description)")
        }
    }
}
