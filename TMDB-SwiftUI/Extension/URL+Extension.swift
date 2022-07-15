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
    static var movie = URL(string: baseURL.absoluteString + "movie/popular")!
}
