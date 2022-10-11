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
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    
}
