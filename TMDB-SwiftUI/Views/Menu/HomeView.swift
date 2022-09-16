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
                LazyHStack(alignment: .bottom, spacing: 20) {
                    ForEach(vm.trendMovies, id: \.id) { item in
                        
//                        ZStack {
//                            Image("greysAnatomy")
//                                .resizable()
//                                .scaledToFit()
//                        }
//                        .frame(width: 150, height: 225, alignment: .bottomLeading)
                        VStack {
                            ZStack(alignment: .bottomLeading) {
                                Image("greysAnatomy")
                                    .resizable()
                                    .frame(width: 80, height: 150, alignment: .leading)
                                    .scaledToFit()
                            }
                            Text("\(item.name)")
                        }
                        .frame(width: 100, height: 200, alignment: .bottomLeading)
                    }
                }
                .frame(minWidth: 300, maxWidth: .infinity, minHeight: 150, maxHeight: 250, alignment: .leading)
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
