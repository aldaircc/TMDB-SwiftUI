//
//  CastDetailView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 29/11/22.
//

import SwiftUI

struct CastDetailView: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Hello, World!")
                
                Section("Biography") {
                    Text("Content")
                }
                
                Section("Personal Info") {
                    Text("Know for")
                    Text("Content")
                }
            }
        }
    }
}

struct CastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CastDetailView()
    }
}
