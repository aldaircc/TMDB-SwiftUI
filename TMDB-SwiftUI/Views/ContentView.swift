//
//  ContentView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 2/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            ActorCardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
