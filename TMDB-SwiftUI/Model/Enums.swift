//
//  Enums.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 13/07/22.
//

import Foundation

enum CustomError: Error {
    case httpResponse(Int)
    case jsonDecoder(Error)
    case badUrl(String)
    case status(Int)
    case errorApiResponse(Int, Codable)
}

enum MediaType: String, Codable {
    case all
    case movie
    case tv
    case person
}

enum KnownForDepartment: String, Codable {
    case acting
    case directing
    //case creator
    case unknown
    
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "acting": self = .acting
        case "directing": self = .directing
        //case "creator": self = .creator
        default: self = .unknown
        }
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case fr = "fr"
    case de = "de"
    case ta = "ta"
    case ko = "ko"
    case es = "es"
}

enum Languages: CustomStringConvertible {
    case english
    case french
    case german
    case japanese
    case spanish
    case chinese
    
    var description: String {
        switch self {
        case .english:
            return "en"
        case .french:
            return "fr"
        case .german:
            return "de"
        case .japanese:
            return "ja"
        case .spanish:
            return "es"
        case .chinese:
            return "zh"
        }
    }
}
