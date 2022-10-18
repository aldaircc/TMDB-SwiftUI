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
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    /// Image
                    ZStack(alignment: .trailing) {
                        Image("example_detail_pic")
                            .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                        CircularProgressView(progress: .constant(80))
                            .offset(x: -5, y: 110)
                    }
                    
                    /// Category - year - duration (hours and minutes)
                    /// details/description of movie
                    
                    VStack(alignment: .leading) {
                        Text("Overview")
                            .fontWeight(.bold)
                        
                        Text("A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.")
                            .multilineTextAlignment(.leading)
                        
                        Divider()
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Status")
                                    .fontWeight(.bold)
                                Text("Released")
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Original Language")
                                    .fontWeight(.bold)
                                Text("English")
                            }
                        }
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Budget")
                                    .fontWeight(.bold)
                                Text("$2,80")
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Revenue")
                                    .fontWeight(.bold)
                                Text("$14,575")
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    
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
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieTile: "The Simpsons")
    }
}
