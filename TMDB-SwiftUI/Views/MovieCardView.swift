//
//  MovieCardView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 2/07/22.
//

import SwiftUI

struct MovieCardView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottomLeading) {
                Image("greysAnatomy")
                    .resizable()
                    .frame(width: 110, height: 165)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    CircularProgressView(progress: .constant(70))
                        .offset(x: 0, y: -5)
                    Text("Grey's Anatomy")
                        .fontWeight(.heavy)
                        
                    Text("Mar 27, 2005")
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                }
                .offset(x: 8, y: proxy.frame(in: .local).midY * 0.65)
            }
        }
        .frame(width: 110,
               height: 265)
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView()
    }
}
