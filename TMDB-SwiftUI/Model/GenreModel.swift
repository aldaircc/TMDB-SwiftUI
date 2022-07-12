//
//  GenreModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/07/22.
//

import Foundation

typealias Genres = [GenreModel]

struct GenreModel: Codable {
    let id: Int
    let name: String
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
            return "en_EN"
        case .french:
            return "fr-FRE"
        case .german:
            return "de-GER"
        case .japanese:
            return "ja-JPN"
        case .spanish:
            return "es-ES"
        case .chinese:
            return "zh-Hant"
        }
    }
}
