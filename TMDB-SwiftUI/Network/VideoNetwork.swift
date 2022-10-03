//
//  VideoNetwork.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 2/10/22.
//

import Foundation

protocol VideoRequestProtocol {
    func getVideo(movieId: Int)
}

struct VideoNetwork: VideoRequestProtocol {
    func getVideo(movieId: Int) {
        
    }
}
