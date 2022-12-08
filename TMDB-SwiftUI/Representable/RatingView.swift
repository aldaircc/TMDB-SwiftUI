//
//  RatingView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 6/12/22.
//

import Foundation
import SwiftUI

struct RatingView: UIViewRepresentable {
    typealias UIViewType = RatingControl
    var ratingControl = RatingControl()
    @State var message = ""
    
    func makeUIView(context: Context) -> RatingControl {
        ratingControl.setupView()
        ratingControl.setupMethod()
        return ratingControl
    }
    
    func updateUIView(_ uiView: RatingControl, context: Context) {
        
    }
}
