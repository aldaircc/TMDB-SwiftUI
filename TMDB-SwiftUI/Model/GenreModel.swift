//
//  GenreModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/07/22.
//

import Foundation

typealias Genres = GenreResult

struct GenreModel: Codable {
    let id: Int
    let name: String
}

struct GenreResult: Codable {
    let genres: [GenreModel]
}
