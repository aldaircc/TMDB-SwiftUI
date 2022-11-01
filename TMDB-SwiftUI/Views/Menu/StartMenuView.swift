//
//  StartMenuView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 9/09/22.
//

import SwiftUI

struct StartMenuView: View {
    var body: some View {
        VStack {
            TabView(selection: .constant(1)) {
                Text("Menu")
                    .tabItem {
                        Image(systemName: "house")
                    }
                Text("Explore")
                    .tabItem {
                        Image(systemName: "Lupa")
                    }
                Text("Favorites")
                    .tabItem {
                        Image(systemName: "star")
                    }
            }
        }
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}
