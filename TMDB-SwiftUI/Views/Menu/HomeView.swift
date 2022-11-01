//
//  HomeView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 10/09/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm = MovieViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("What's popular")
                Spacer()
                Button("See all") {
                    
                }
            }
            
            HStack {
                Text("Latest Trailers")
                Button("See all") {
                    
                }
            }
            
            HStack {
                Text("Trending")
                Button("See all") {
                    
                }
            }
            
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(alignment: .center, spacing: 20) {
                    ForEach(vm.trendMovies, id: \.id) { item in
                        CardView(movieTitle: item.title ?? "-", releaseDate: Date(), rateValue: item.voteAverage ?? 0, imageUrl: item.posterUrl)
                    }
                }
                .frame(minWidth: 300, maxWidth: .infinity, minHeight: 185, maxHeight: 280, alignment: .leading)
                .background {
                    Image("trending-bg")
                        .resizable()
                }
            }
        }
        .task {
            await vm.getTrendingMovies()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
