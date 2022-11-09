//
//  MovieViewModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/09/22.
//

import Foundation

final class MovieViewModel: ObservableObject {
    
    @Published var casts: Casts = Casts(id: 0, cast: [])
    @Published var trendingResult: TrendingResult?
    @Published var error = ""
    let network: MovieNetwork
    var trendMovies: [MovieTrending] {
        return trendingResult?.results ?? []
    }
        
    init(_ network: MovieNetwork = MovieNetwork()) {
        self.network = network
    }
    
    func getCasts(movieId: Int, mediaType: MediaType) {
        network.getCast(mediaType, id: movieId) { result in
            switch result {
            case .success(let data):
                self.casts = data
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }
    
    func getTrendingMovies(_ page: Int = 1, mediaType: MediaType = .movie, timeWindow: String = "week") async {
        let movies = await network.getTrendings(page, mediaType: mediaType.rawValue, timeWindow: timeWindow)
        await MainActor.run(body: {
            trendingResult = movies
        })
    }
}
