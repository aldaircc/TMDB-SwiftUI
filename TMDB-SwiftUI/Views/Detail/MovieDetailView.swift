//
//  MovieDetailView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 7/10/22.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Section {
                HStack {
                    Text("Media")
                        .fontWeight(.bold)
                    Spacer()
                }
                LazyHStack {
                    RoundedRectangle(cornerRadius: 9)
                        .frame(minWidth: 300, maxHeight: 150)
                }
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
