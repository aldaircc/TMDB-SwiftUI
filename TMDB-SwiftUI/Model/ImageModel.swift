//
//  ImageModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 15/07/22.
//

import Foundation

struct ImageModel: Codable, Hashable {
    let aspectRatio: Double
    let height: Int
    let iso6391: String?
    let filePath: String
    let voteAverage: Double
    let voteCount: Int
    let width: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(filePath)
    }
    
    enum CodingKeys: String, CodingKey {
        case height, width
        case aspectRatio = "aspect_ratio"
        case iso6391 = "iso_639_1"
        case filePath = "file_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct ImageResult: Codable {
    let id: Int
    let logos, posters, backdrops: [ImageModel]
    
    enum CodingKeys: String, CodingKey {
        case id, logos, posters, backdrops
    }
}
