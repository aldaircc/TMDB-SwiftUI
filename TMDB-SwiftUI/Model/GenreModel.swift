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
