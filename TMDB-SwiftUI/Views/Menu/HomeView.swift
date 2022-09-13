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
                LazyHStack {
                    Button("ACEPTAR 1") {
                        
                    }
                    Button("ACEPTAR 2") {
                        
                    }
                    Button("ACEPTAR 3") {
                        
                    }
                    Button("ACEPTAR 4") {
                        
                    }
                    Button("ACEPTAR 5") {
                        
                    }
                    Button("ACEPTAR 6 ") {
                        
                    }
                    Button("ACEPTAR 7 ") {
                        
                    }
                }
                .frame(minWidth: 300, maxWidth: .infinity, minHeight: 150, maxHeight: 250, alignment: .leading)
                .background {
                    Image("trending-bg")
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
