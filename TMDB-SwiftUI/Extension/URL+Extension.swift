//
//  URL+Extension.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/07/22.
//

import Foundation

extension URL {
    static var baseURL = URL(string: "https://api.themoviedb.org/3/")!
    static var genre = URL(string: baseURL.absoluteString + "genre/movie/list")!
    static var trending = URL(string: baseURL.absoluteString + "trending/")!
    static var movie = URL(string: baseURL.absoluteString + "movie/")!
    static var moviePopular = URL(string: baseURL.absoluteString + "popular")!
    static var movieImages = URL(string: baseURL.absoluteString + "movie")!

    /// Authentication
    static var authentication = URL(string: baseURL.absoluteString + "/authentication/")!
    static var authenticationGuestSession = URL(string: authentication.absoluteString + "guest_session/new")!
    
    func addQuery(_ name: String, _ value: String) -> URL {
        guard var urlComponents = URLComponents(string: self.absoluteString)  else {
            return absoluteURL
        }
        var queryItems = urlComponents.queryItems ?? []
        let queryItem = URLQueryItem(name: name, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        return urlComponents.url ?? absoluteURL
    }
    
    func addApiKey() -> URL {
        return addQuery("api_key", "457aa6528c2f6fe3ff02984ae2058d6d")
    }
}
