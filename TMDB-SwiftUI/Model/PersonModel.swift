//
//  PersonModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 28/11/22.
//

import Foundation

struct Person: Codable {
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case also_known_as = "also_known_as"
        case biography = "biography"
        case birthday = "birthday"
        case deathday = "deathday"
        case gender = "gender"
        case homepage = "homepage"
        case id = "id"
        case imdb_id = "imdb_id"
        case known_for_department = "known_for_department"
        case name = "name"
        case place_of_birth = "place_of_birth"
        case popularity = "popularity"
        case profile_path = "profile_path"
    }
    
    let adult: Bool
    let also_known_as: [String]?
    let biography: String?
    let birthday: String?
    let deathday: String?
    let gender: Int?
    let homepage: String?
    let id: Int
    let imdb_id: String?
    let known_for_department: String?
    let name: String?
    let place_of_birth: String?
    let popularity: Double?
    let profile_path: String?
    var genderType: CastGender {
        CastGender(rawValue: gender)
    }
    var path: URL {
        guard let profilePath = profile_path,
              let url = URL(string: "https://image.tmdb.org/t/p/w200\(profilePath)") else {
            return .baseURL
        }
        
        return url
    }
}

enum CastGender: RawRepresentable, CustomStringConvertible {
    case male
    case female
    case nonDefined
    
    var description: String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        case .nonDefined:
            return "Not defined"
        }
    }
    
    var rawValue: Int? {
        switch self {
        case .female:
            return 1
        case .male:
            return 2
        case .nonDefined:
            return nil
        }
    }
    
    init(rawValue: Int?) {
        switch rawValue {
        case 1: self = .female
        case 2: self = .male
        default: self = .nonDefined
        }
    }
}
