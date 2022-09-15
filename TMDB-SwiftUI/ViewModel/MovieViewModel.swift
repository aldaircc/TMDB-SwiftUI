//
//  MovieViewModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/09/22.
//

import Foundation

final class MovieViewModel: ObservableObject {
    
    @Published var trendingResult: TrendingResult?
    let network: Network
    var trendMovies: [ResultTrending] {
        return trendingResult?.results ?? []
    }
        
    init(_ network: Network = Network()) {
        self.network = network
    }
    
    func getTrendingMovies(_ page: Int = 1, mediaType: String = "person", timeWindow: String = "week") async {
        let movies = await network.getTrendings(page, mediaType: mediaType, timeWindow: timeWindow)
        await MainActor.run(body: {
            trendingResult = movies
        })
    }
}
