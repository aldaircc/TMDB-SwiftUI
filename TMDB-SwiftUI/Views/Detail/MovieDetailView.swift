//
//  MovieDetailView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 7/10/22.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            /// Image
            /// Category - year - duration (hours and minutes)
            /// details/description of movie
            
            /// Series Cast
            Section {
                HStack(alignment: .top) {
                    Text("Series Cast")
                        .fontWeight(.bold)
                    Spacer()
                }
                
            }
            
            /// Score Breakdown
            ///
            Section {
                HStack {
                    Text("Media")
                        .fontWeight(.bold)
                    Spacer()
                }
  
               
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top) {
                        
                        
                    }
                }
                .frame(height: 200, alignment: .leading)
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
