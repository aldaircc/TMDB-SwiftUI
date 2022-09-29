//
//  MovieViewModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/09/22.
//

import Foundation

final class MovieViewModel: ObservableObject {
    
    @Published var trendingResult: TrendingResult? //TrendingResult?
    let network: Network
    var trendMovies: [MovieTrending] { //[ResultTrending] {
        return trendingResult?.results ?? []
    }
        
    init(_ network: Network = Network()) {
        self.network = network
        URLCache.shared.memoryCapacity = 10_000_000
        URLCache.shared.diskCapacity = 1_000_000_000
    }
    
    func getTrendingMovies(_ page: Int = 1, mediaType: String = "movie", timeWindow: String = "week") async {
        let movies = await network.getTrendings(page, mediaType: mediaType, timeWindow: timeWindow)
        await MainActor.run(body: {
            trendingResult = movies
        })
    }
}
