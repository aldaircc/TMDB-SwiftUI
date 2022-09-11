//
//  HomeView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 10/09/22.
//

import SwiftUI

struct HomeView: View {
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
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
