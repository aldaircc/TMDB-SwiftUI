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
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.white)
                    .frame(width: 117, height: 35)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Gillian Jacobs")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                    }
                    .background(Color.white)
                    HStack {
                        Text("Brianne")
                            .font(.system(size: 10))
                            .fontWeight(.light)
                        
                    }
                }
                .padding(.horizontal, 5)
            }
            .cornerRadius(1)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 9, style: .continuous)
                .stroke(.black.opacity(0.1), lineWidth: 0.4)
                .shadow(color: .black, radius: 10, x: 0, y: 0)
        )
    }
}

struct ActorCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActorCardView()
            .previewLayout(.fixed(width: 300, height: 400))
    }
}
