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
    
    var movieHeaderView: some View  {
        ZStack(alignment: .bottomTrailing) {
            ImageView(withURL: movie?.posterUrl ?? .baseURL, pictureMode: .landScape)
            
            CircularProgressView(progress: .constant(movie?.percetageRate ?? 0))
                .offset(x: -5, y: 15)
        }
    }
    
    var movieOverView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(movie?.title ?? "")
                .fontWeight(.bold)
            
            Text("Overview")
                .fontWeight(.bold)
            
            Text(movie?.overview ?? "")
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal)
    }
    
    var detailOverview: some View {
        VStack(spacing: 10) {
            HStack  {
                MovieInfoView(fieldTitle: "Status",
                              fieldValue: vm.movieDetail?.status ?? "",
                              isCurrencyFormat: false)
                Spacer()
                MovieInfoView(fieldTitle: "Original Language",
                              fieldValue: vm.movieDetail?.originalLanguage?.description ?? "",
                              isCurrencyFormat: false)
            }
            
            HStack {
                MovieInfoView(fieldTitle: "Budget",
                              fieldValue: String(vm.movieDetail?.budget ?? 0),
                              isCurrencyFormat: true)
                Spacer()
                MovieInfoView(fieldTitle: "Revenue",
                              fieldValue: String(vm.movieDetail?.revenue ?? 0),
                              isCurrencyFormat: true)
            }
        }
        .padding(.horizontal)
    }
    
    var castBilledSection: some View {
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
                                .onTapGesture {
                                    vm.goToCastDetail(cast.id)
                                }
                        }
                        Button(action: {
                            vm.isGoCast = true
                        }) {
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
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 10) {
                movieHeaderView

                movieOverView
                
                Divider()
                
                detailOverview
                
                Divider()
                
                castBilledSection
                
                NavigationLink("", isActive: $vm.isGoCast) {
                    CastView(vm: vm)
                }
                
                NavigationLink("", isActive: $vm.isNavigateToCastDetail) {
                    CastDetailView(vm: vm)
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await vm.getDetail(movieId: movie?.id ?? 0)
            vm.getCasts(movieId: movie?.id ?? 0,
                        mediaType: movie?.mediaType ?? .movie)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(vm: MovieViewModel(), movie: .testValue)
    }
}
