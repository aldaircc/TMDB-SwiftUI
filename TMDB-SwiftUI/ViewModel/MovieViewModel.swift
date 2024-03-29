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
    @Published var movieDetail: MovieDetailModel?
    @Published var videoResult: VideoResponseModel?
    @Published var imageResult: ImageResult?
    @Published var error = ""
    let network: MovieNetwork
    var trendMovies: [MovieTrending] {
        return trendingResult?.results ?? []
    }
    
    var castImages: [CastModel] {
        let startIndex = casts.cast.startIndex
        let endIndex = casts.cast.count < 5 ? casts.cast.count : 5
        
        guard endIndex >= 1 else {
            return []
        }
        
        let elements = Array<CastModel>(casts.cast[startIndex..<endIndex])
        return elements
    }
    
    init(_ network: MovieNetwork = MovieNetwork()) {
        self.network = network
    }
    
    func getCasts(movieId: Int, mediaType: MediaType) {
        network.getCast(mediaType, id: movieId) { result in
            switch result {
            case .success(let data):
                Task {
                    await MainActor.run { [weak self] in
                        guard let self = self else {
                            return
                        }
                        self.casts = data
                    }
                }
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }
    
    func getTrendingMovies(_ page: Int = 1, mediaType: MediaType = .movie, timeWindow: TimeWindow = .today) async {
        let movies = await network.getTrendings(page, mediaType: mediaType, timeWindow: timeWindow)
        await MainActor.run(body: {
            trendingResult = movies
        })
    }
    
    /// Details
    func getVideo(movieId: Int) {
        network.getVideo(movieId: movieId) { response in
            switch response {
            case .success(let data):
                Task {
                    await MainActor.run {
                        self.videoResult = data
                    }
                }
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }
    
    func getImages(movieId: Int) async {
        do {
            imageResult = try await network.getImages(movieId: movieId)
        } catch {
            ()
        }
    }
    
    func getDetail(movieId: Int) async {
        Task {
            let data = try await network.getDetail(movieId)
            await MainActor.run {
                self.movieDetail = data
            }
        }
        
    }
}
