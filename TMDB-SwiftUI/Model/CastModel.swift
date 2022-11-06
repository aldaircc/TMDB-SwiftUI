//
//  CastModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 1/11/22.
//

import Foundation

struct CastModel: Codable {
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case castId = "cast_id"
        case character = "character"
        case creditId = "credit_id"
        case order = "order"
    }
    
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownForDepartment: String?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castId: Int?
    let character: String?
    let creditId: String?
    let order: Int?
}



typealias Casts = CastResult

struct CastResult: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case cast = "cast"
    }
    
    let id: Int
    let cast: [CastModel]
}
