//
//  ActorCardView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 6/07/22.
//

import SwiftUI

struct ActorCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image("Gillian Jacobs")
                .resizable()
                .frame(width: 120, height: 175, alignment: .center)

        }
        .background(.red)
        .cornerRadius(10)
        .padding()
    }
}

struct ActorCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActorCardView()
            .previewLayout(.fixed(width: 300, height: 400))
    }
}
