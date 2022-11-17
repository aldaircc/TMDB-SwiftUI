//
//  MovieDetailView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 7/10/22.
//

import SwiftUI

struct MovieDetailView: View {
    let movieTile: String
    @ObservedObject var vm: MovieViewModel
    @ObservedObject var detailVM = MovieDetailViewModel()
    
    var logos: [ImageModel] {
        detailVM.imagesResponse?.logos ?? []
    }
    
    var posters: [ImageModel] {
        detailVM.imagesResponse?.posters ?? []
    }
    
    var backdrops: [ImageModel] {
        detailVM.imagesResponse?.backdrops ?? []
    }
    
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
                        Text("\(movieTile)")
                            .fontWeight(.bold)
                        
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
                    
                    
                    /// Score Breakdown
                    Section {
                        CustomTopBar(sectionName: "Demo", images: [
                            .backdrop: backdrops,
                            .poster: posters,
                            .logo: logos
                        ])
                        
                        Spacer()
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
            .task {
                await detailVM.getImages(movieId: 894205)
                vm.getCasts(movieId: 779782,
                            mediaType: .movie)
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieTile: "The Simpsons", vm: MovieViewModel())
    }
}
