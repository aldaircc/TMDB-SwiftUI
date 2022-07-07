//
//  ActorCardView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 6/07/22.
//

import SwiftUI

struct ActorCardView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("Gillian Jacobs")
                .resizable()
                .scaledToFit()
                .frame(width: 117, height: 175, alignment: .center)
                .background(.yellow)
                .cornerRadius(10)
//                .overlay(
//                    VStack(alignment: .leading) {
//                        Spacer()
//                        HStack {
//                            Text("Gillian Jacobs")
//                                .font(.system(size: 14))
//                                .fontWeight(.semibold)
//                            Spacer()
//                        }
//                        .background(Color.white)
//                        HStack {
//                            Text("Brianne")
//                                .font(.system(size: 11))
//                                .fontWeight(.light)
//                            Spacer()
//                        }
//                        .background(Color.white)
//                    }
//                )
        }
        .overlay(
            RoundedRectangle(cornerRadius: 9, style: .circular)
                .stroke(.white, lineWidth: 1)
                .shadow(color: .black, radius: 3, x: 2, y: 0)
        )
    }
}

struct ActorCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActorCardView()
            .previewLayout(.fixed(width: 300, height: 400))
    }
}
