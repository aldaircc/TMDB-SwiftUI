//
//  ContentView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 2/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                MovieCardView()
                    .frame(width: 100, height: 30)
                MovieCardView()
                MovieCardView()
                MovieCardView()
                MovieCardView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
