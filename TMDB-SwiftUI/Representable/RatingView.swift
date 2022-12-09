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
    @Binding var message: String
    
    func makeUIView(context: Context) -> RatingControl {
        ratingControl.setupView()
        ratingControl.setupMethod()
        ratingControl.delegate = context.coordinator
        return ratingControl
    }
    
    func updateUIView(_ uiView: RatingControl, context: Context) {
        
    }
    
    func makeCoordinator() -> RatingCoordinator {
        RatingCoordinator(parent: self)
    }
}

class RatingCoordinator: NSObject, RatingControlDelegate {
    var parent: RatingView
    
    init(parent: RatingView) {
        self.parent = parent
    }
    
    func sendMessage(_ message: String) {
        parent.message = "Hello \(message)"
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(message: .constant("This my message"))
    }
}
