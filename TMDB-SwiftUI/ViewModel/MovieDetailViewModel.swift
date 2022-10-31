//
//  MovieDetailViewModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 5/10/22.
//

import Foundation

final class MovieDetailViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var videoResponse: VideoResponseModel?
    @Published var imagesResponse: ImageResult?
    let videoNetwork = VideoNetwork()
    
    func getMovieVideos(movieId: Int) {
        videoNetwork.getVideo(movieId: movieId) { response in
            switch response {
            case .success(let result):
                DispatchQueue.main.async {
                    self.videoResponse = result
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func getImages(movieId: Int) async {
        let network = Network()
        let response = try? await network.getImages(movieId: movieId)
        await MainActor.run {
            imagesResponse = response
        }
    }
}
