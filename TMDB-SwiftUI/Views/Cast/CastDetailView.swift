//
//  CastDetailView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 29/11/22.
//

import SwiftUI

struct CastDetailView: View {
    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Image(systemName: "play.fill")
                    
                    Section("Biography") {
                        Text("Content")
                    }
                    
                    Section("Personal Info") {
                        Text("Know for")
                        Text("Content")
                    }
                }
//                .frame(width: 390)
                Spacer()
            }
        }
    }
}

struct CastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CastDetailView()
    }
}
