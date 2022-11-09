//
//  MovieViewModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/09/22.
//

import Foundation

final class MovieViewModel: ObservableObject {
    
    @Published var trendingResult: TrendingResult?
    let network: MovieNetwork
    var trendMovies: [MovieTrending] {
        return trendingResult?.results ?? []
    }
        
    init(_ network: MovieNetwork = MovieNetwork()) {
        self.network = network
    }
    
    func getCasts(movieId: Int, mediaType: MediaType) {
        CastNetwork().getCast(mediaType, id: movieId) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getTrendingMovies(_ page: Int = 1, mediaType: String = "movie", timeWindow: String = "week") async {
        let movies = await network.getTrendings(page, mediaType: mediaType, timeWindow: timeWindow)
        await MainActor.run(body: {
            trendingResult = movies
        })
    }
}
