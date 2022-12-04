//
//  CastModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 1/11/22.
//

import Foundation

struct CastModel: Codable, Identifiable {
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
    let id: Int
    let knownForDepartment: String?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castId: Int?
    let character: String?
    let creditId: String?
    let order: Int?
    
    var imagePath: URL {
        return URL(string: "https://image.tmdb.org/t/p/w200\(profilePath ?? "")") ?? URL(string: "https://google.com")!
    }
}

enum CastGender: RawRepresentable {
    case male
    case female
    case nonDefined
    
    var rawValue: Int? {
        switch self {
        case .male:
            return 1
        case .female:
            return 2
        case .nonDefined:
            return nil
        }
    }
    
    init(rawValue: Int?) {
        switch rawValue {
        case 1: self = .male
        case 2: self = .female
        default: self = .nonDefined
        }
    }
}

typealias Casts = CastResult

struct CastResult: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case cast = "cast"
    }
    
    let id: Int
    let cast: [CastModel]
}
