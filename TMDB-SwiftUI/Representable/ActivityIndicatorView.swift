//
//  ActivityIndicatorView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 10/12/22.
//

import Foundation
import SwiftUI

enum ActivityState {
    case notSet
    case loading
    case ended
}

struct ActivityIndicatorView: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    var activityIndicatorView = UIViewType(style: .medium)
    @Binding var state: ActivityState
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        activityIndicatorView.color = .white
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        switch state {
        case .notSet, .ended:
            uiView.stopAnimating()
        case .loading:
            uiView.startAnimating()
        }
    }
}