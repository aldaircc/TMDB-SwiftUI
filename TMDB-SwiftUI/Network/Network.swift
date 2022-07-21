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
        
        var components = URLComponents(string: "\(URL.moviePopular.absoluteString)")
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
    
    func getDetail(_ movieId: Int) async throws -> MovieDetailModel? {
        let components = URLComponents(string: "\(URL.movie.absoluteString)\(movieId)")
        
        guard let finalUrl = components?.url?.addApiKey() else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: finalUrl)
            
            guard data.count != 0 else {
                return nil
            }
            let result = try JSONDecoder().decode(MovieDetailModel.self, from: data)
            return result
        } catch {
            return nil
        }
    }
    
    /// Rating
    func rateMovie(_ movieId: Int) async throws -> ResponseModel? {
        let components = URLComponents(string: "\(URL.movie)\(movieId)/rating")
        guard let url = components?.url?.addApiKey() else {
            return nil
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse  else {
                return nil
            }
            if httpResponse.statusCode == 200 {
                let result = try JSONDecoder().decode(ResponseModel.self, from: data)
                return result
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
    func deleteRating(_ movieId: Int) async throws -> ResponseModel? {
        let components = URLComponents(string: "\(URL.movie)\(movieId)/rating")
        guard let url = components?.url?.addApiKey() else {
            return nil
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse  else {
                return nil
            }
            if httpResponse.statusCode == 200 {
                let result = try JSONDecoder().decode(ResponseModel.self, from: data)
                return result
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
    ///Authentication
    func createGuestSession() async throws -> SessionModel? {
        let components = URLComponents(string: URL.authGuestSession.absoluteString)
        guard let url = components?.url?.addApiKey() else {
            return nil
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httResponse = response as? HTTPURLResponse else {
                return nil
            }
            
            if httResponse.statusCode == 200 {
                let result = try JSONDecoder().decode(SessionModel.self, from: data)
                return result
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
    func createRequestToken() async throws -> SessionModel? { ///1
        let components = URLComponents(string: URL.authGuestSession.absoluteString)
        guard let url = components?.url else {
            throw CustomError.badUrl("Bad url")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw CustomError.badUrl("Cannot convert to HTTPURLResponse")
            }
            
            if httpResponse.statusCode == 200 {
                let result = try JSONDecoder().decode(SessionModel.self, from: data)
                return result
            } else {
                throw CustomError.status(httpResponse.statusCode)
            }
        } catch {
            throw CustomError.badUrl("Bad url")
        }
    }
    
    func createSessionWithLogin(_ requestToken: String, username: String, password: String) async throws -> SessionLoggedModel? { ///2
        ///To do
        let components = URLComponents(string: URL.authValidateWithLogin.absoluteString)
        guard let url = components?.url?.addApiKey() else {
            throw CustomError.badUrl("Bad url")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "Post"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let parameter = ["username": username,
                         "password": password,
                         "request_token": requestToken]
        if let data = try? JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted) {
            request.httpBody = data
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw CustomError.badUrl("Cannot convert to HTTPURLResponse")
            }
            
            if httpResponse.statusCode == 200 {
                let result = try JSONDecoder().decode(SessionLoggedModel.self, from: data)
                print(result)
                return result
            } else {
                throw CustomError.status(httpResponse.statusCode)
            }
        } catch {
            throw CustomError.badUrl("Bad url")
        }
    }
    
    func createSession(_ requestToken: String) { ///2
        ///To do
        
        /*: Parameter
         {
         "request_token": "570c40b1dd114b5480643d0f5e1f5ae7dd9799d7"
         }
         */
    }
    
    
    func createGuestSession() {
        ///To do
    }
}
