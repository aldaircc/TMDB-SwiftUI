//
//  ImageModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 15/07/22.
//

import Foundation

struct ImageModel: Codable {
    let aspectRatio: Double
    let height: Int
    let iso6391: String?
    let filePath: String
    let voteAverage: Double
    let voteCount: Int
    let width: Int
    
    enum CodingKeys: String, CodingKey {
    case aspectRatio = "aspect_ratio"
        case height, width
        case iso6391 = "iso_639_1"
        case filePath = "file_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct ImageResult: Codable {
    let backDrops: [ImageModel]
    
    enum CodingKeys: String, CodingKey {
        case backDrops = "backdrops"
    }
}
