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
            AsyncImage(url: movie?.posterUrl) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fit)
            
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
                              fieldValue: "English",
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
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 10) {
                    movieHeaderView

                    movieOverView
                    
                    Divider()
                    
                    detailOverview
                    
                    Divider()
                    
                    castBilledSection
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
                await vm.getDetail(movieId: movie?.id ?? 0)
                vm.getCasts(movieId: movie?.id ?? 0,
                            mediaType: movie?.mediaType ?? .movie)
            }
        }
    }
}

struct MovieInfoView: View {
    let fieldTitle: String
    let fieldValue: String
    let isCurrencyFormat: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fieldTitle)
                .fontWeight(.bold)
            
            if isCurrencyFormat {
                Text(Int(fieldValue) ?? 0, format: .currency(code: "USD"))
            } else {
                Text(fieldValue)
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(vm: MovieViewModel(), movie: .testValue)
    }
}
