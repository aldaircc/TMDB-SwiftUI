//
//  Network.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/07/22.
//

import Foundation

struct Network {
    
    func getGenres(_ language: Languages = .english) async throws -> Genres? {
        
        let queryItems = [
            URLQueryItem(name: "api_key", value: ""),
            URLQueryItem(name: "language", value: language.description)
        ]
        
        var components = URLComponents(string: URL.genre.absoluteString)
        if !queryItems.isEmpty {
            components?.queryItems = queryItems
        }
        
        guard let finalUrl = components?.url  else {
            return nil
        }
        
        let (data, response) = try await URLSession.shared.data(from: finalUrl)
        
        guard let urlResponse = response as? HTTPURLResponse else {
            return nil
        }
        
        guard urlResponse.statusCode == 200 else {
            return nil
        }
        
        do {
            return try JSONDecoder().decode(Genres.self, from: data)
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
    
    func getTrendings(_ page: Int, mediaType: String, timeWindow: String) async -> TrendingResult? {
        let queryItems = [
            URLQueryItem(name: "api_key", value: ""),
            URLQueryItem(name: "page", value: String(describing: page))
        ]
        
        var components = URLComponents(string: "\(URL.trending.absoluteString)\(mediaType)/\(timeWindow)")
        components?.queryItems = queryItems
        
        do {
            let (data, request) = try await URLSession.shared.data(from: components!.url!)
            
            if data.count != 0 {
                let result = try JSONDecoder().decode(TrendingResult.self, from: data)
                print(result)
                return result
            }
            
        } catch {
            print(error)
            return nil
        }
        
        return nil
    }
    
    func getFavoriteMovies(_ page: Int, language: OriginalLanguage = .en) async -> MovieResult? {
        let queryItems = [
            URLQueryItem(name: "api_key", value: ""),
            URLQueryItem(name: "page", value: String(describing: page)),
            URLQueryItem(name: "language", value: language.rawValue)
        ]
        
        var components = URLComponents(string: "\(URL.movie.absoluteString)")
        components?.queryItems = queryItems
        do {
            let (data, _) = try await URLSession.shared.data(from: components!.url!)
            
            if data.count != 0 {
                let result = try JSONDecoder().decode(MovieResult.self, from: data)
                print(result)
                return result
            }
        } catch {
            print(error)
            return nil
        }
        
        return nil
    }
    
    func getImages(movieId: Int) async throws -> ImageResult? {
        let items = [
            URLQueryItem(name: "api_key", value: "")
        ]
        var components = URLComponents(string: "\(URL.movieImages.absoluteString)/\(movieId)/images")
        components?.queryItems = items
        
        do {
            let (data, _) = try await URLSession.shared.data(from: components!.url!)
            if data.count != 0 {
                let result = try JSONDecoder().decode(ImageResult.self, from: data)
                return result
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}

