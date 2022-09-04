//
//  MovieModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 14/07/22.
//

import Foundation

struct MovieModel: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, adult, overview, popularity, title, video
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieResult: Codable {
    let page: Int
    let results: [MovieModel]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

/*:
 {
 "page": 1,
 "results": [
 {
 "adult": false,
 "backdrop_path": "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
 "genre_ids": [
 10751,
 16,
 12,
 35,
 14
 ],
 "id": 438148,
 "original_language": "en",
 "original_title": "Minions: The Rise of Gru",
 "overview": "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
 "popularity": 12936.182,
 "poster_path": "/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg",
 "release_date": "2022-06-29",
 "title": "Minions: The Rise of Gru",
 "video": false,
 "vote_average": 7.8,
 "vote_count": 291
 }
 ],
 "total_pages": 34317,
 "total_results": 686321
 }
 */
