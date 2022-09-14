//
//  MovieViewModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/09/22.
//

import Foundation

final class MovieViewModel: ObservableObject {
    
    let network: Network
    var trendMovies: [ResultTrending] {
        return trendingResult?.results ?? []
    } //TrendingResult = []
    
    @Published var trendingResult: TrendingResult?
    
    init(_ network: Network = Network()) {
        self.network = network
    }
    
    func getTrendingMovies(_ page: Int = 1, mediaType: String = "person", timeWindow: String = "week") async -> TrendingResult? {
        let movies = await network.getTrendings(page, mediaType: mediaType, timeWindow: timeWindow)
        trendingResult = movies
        return movies
    }
}
