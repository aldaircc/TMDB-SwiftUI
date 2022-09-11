//
//  MovieViewModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/09/22.
//

import Foundation

final class MovieViewModel: ObservableObject {
    
    let network: Network
    
    init(_ network: Network = Network()) {
        self.network = network
    }
    
    func getTrendingMovies() -> MovieResult? {
        
        return nil
    }
}
