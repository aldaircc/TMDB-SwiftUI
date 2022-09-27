//
//  TrendingModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 12/07/22.
//

import Foundation

struct KnowFor: Codable {
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originCountry = "origin_country"
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
    }
    
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let mediaType: MediaType?
    let title: String?
    let originalLanguage: OriginalLanguage?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let name: String?
    let originCountry: [String]?
    let originalName, firstAirDate: String?
}

struct ResultTrending: Codable {
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownForDepartment = "known_for_department"
        case mediaType = "media_type"
        case name = "name"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
    
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: KnownForDepartment?
    let mediaType: MediaType
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String?
    let knownFor: [KnowFor]?
}

struct MovieTrending: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case id = "id"
        case title = "title"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIds = "genre_ids"
        case popularity = "popularity"
        case releaseDate = "release_date"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    let adult: Bool?
    let backdropPath: String? //"/Yc9q6QuWrMp9nuDm5R8ExNqbEq.jpg",
    let id: Int?
    let title: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String? //"/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg",
    let mediaType: String?
    let genreIds: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    var posterUrl: URL {
        URL(string: "\()\(posterPath ?? "")")!
    }
}

struct TrendingResult: Codable {
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    let page: Int?
    let results: [MovieTrending]? //[ResultTrending]?
    let totalPages: Int?
    let totalResults: Int?
}
