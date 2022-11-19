//
//  MovieDetailView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 7/10/22.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var vm: MovieViewModel
    var movie: MovieTrending?
    
    var movieHeaderView: some View {
        ZStack(alignment: .trailing) {
            AsyncImage(url: movie?.posterUrl) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fit)
            
            CircularProgressView(progress: .constant(movie?.percetageRate ?? 0))
                .offset(x: -5, y: 110)
        }
    }
    
    var movieOverView: some View {
        VStack(alignment: .leading) {
            Text(movie?.title ?? "")
                .fontWeight(.bold)
            
            Text("Overview")
                .fontWeight(.bold)
            
            Text(movie?.overview ?? "")
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
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    movieHeaderView
                    
                    movieOverView
                    
                    Divider()
                    
                    /// Top Billed cast
                    Section {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Top Billed Cast")
                                    .fontWeight(.bold)
                            }
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 5) {
                                    ForEach(vm.castImages, id:\.id) { cast in
                                        ActorCardView(cast: cast)
                                    }
                                    Button(action: { print("Show more image") }) {
                                        HStack(spacing: 2) {
                                            Text("View more")
                                                .font(.system(size: 11, weight: .semibold, design: .rounded))
                                            Image(systemName: "arrow.right.square.fill")
                                        }
                                        .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .ignoresSafeArea(edges: .bottom)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    let appearance = UINavigationBarAppearance()
                    appearance.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
                    UINavigationBar.appearance().standardAppearance = appearance
                    UINavigationBar.appearance().scrollEdgeAppearance = appearance
                }
            }
            .task {
                vm.getCasts(movieId: movie?.id ?? 0,
                            mediaType: .movie)
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(vm: MovieViewModel(), movie: .testValue)
    }
}
