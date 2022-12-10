//
//  ActivityIndicatorView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 10/12/22.
//

import Foundation
import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    
    var activityIndicatorView: UIActivityIndicatorView?
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        guard let activityIndicatorView = activityIndicatorView else {
            return UIActivityIndicatorView()
        }
        
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
