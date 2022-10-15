//
//  MovieDetailView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 7/10/22.
//

import SwiftUI

struct MovieDetailView: View {
    let movieTile: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                /// Image
                Image("example_detail_pic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                
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
            .ignoresSafeArea(edges: .bottom)
            .navigationTitle(movieTile)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieTile: "The Simpsons")
    }
}
