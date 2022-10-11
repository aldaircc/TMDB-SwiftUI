//
//  YoutubeVideoView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 10/10/22.
//

import Foundation
import SwiftUI
import WebKit

struct YoutubeVideoView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    
    var videoIdentifier: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let path = "https://www.youtube.com/watch?v=\(videoIdentifier)"
        
        guard let url = URL(string: path) else {
            return
        }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: url))
    }
    
    
}
