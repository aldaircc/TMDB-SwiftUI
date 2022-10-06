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
    
    func getMovieVideos() {
        
    }
    
}
