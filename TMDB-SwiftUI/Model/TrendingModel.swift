//
//  TrendingModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 12/07/22.
//

import Foundation

enum MediaType: String, Codable {
    case all
    case movie
    case tv
    case person
}

enum KnownForDepartment: String, Codable {
    case acting = "Acting"
    case directing = "Directing"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case fr = "fr"
    case de = "de"
    case ta = "ta"
    case ko = "ko"
}

struct KnowFor: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let mediaType: MediaType
    let title: String?
    let originalLanguage: OriginalLanguage
    let originalTitle: String?
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let name: String?
    let originCountry: [String]?
    let originalName, firstAirDate: String?

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
    let knownForDepartment: KnownForDepartment
    let mediaType: MediaType
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String?
    let knownFor: [KnowFor]?
}

struct TrendingResult: Codable {
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    let page: Int
    let results: [ResultTrending]
    let totalPages: Int
    let totalResults: Int
}
