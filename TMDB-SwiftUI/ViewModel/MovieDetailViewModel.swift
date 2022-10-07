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
}
