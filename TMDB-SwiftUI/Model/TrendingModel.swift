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
    let backdropPath: String?
    let id: Int?
    let title: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let mediaType: MediaType? // String?
    let genreIds: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    var posterUrl: URL {
        URL(string: "\(baseImagePath)\(posterPath ?? "")")!
    }
    var percetageRate: Double {
        guard let voteAverage = voteAverage else {
            return 0.0
        }
        
        return voteAverage * 10
    }
    
    static let testValue = MovieTrending(adult: false, backdropPath: "/yYrvN5WFeGYjJnRzhY0QXuo4Isw.jpg", id: 505642,
                                     title: "Black Panther: Wakanda Forever", originalLanguage: "en", originalTitle: "Black Panther: Wakanda Forever",
                                         overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death. As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.", posterPath: "/sv1xJUazXeYqALzczSZ3O6nkH75.jpg", mediaType: .init(rawValue: "movied"),
                                     genreIds: [28, 12, 878], popularity: 3441.331, releaseDate: "2022-11-09",
                                     video: false, voteAverage: 7.508, voteCount: 750)
}

struct TrendingResult: Codable {
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    let page: Int?
    let results: [MovieTrending]?
    let totalPages: Int?
    let totalResults: Int?
}
