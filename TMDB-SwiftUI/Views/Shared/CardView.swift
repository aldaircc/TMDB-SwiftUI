//
//  CardView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 15/09/22.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottomLeading) {
                Image("greysAnatomy")
                    .resizable()
                    .frame(width: 120, height: 185)
                    .cornerRadius(9)
                
                VStack(alignment: .leading, spacing: 10) {
                    ZStack {
                        Circle()
                        Circle()
                            .trim(from: 0.0, to: 0.5)
                            .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle.degrees(-90))
                            .foregroundColor(.orange)
                    }
                    .frame(width: 30)
                    
                    VStack {
                        Text("My favorite movie")
                        Text("Release date")
                            .font(.system(size: 11, weight: .thin))
                            .foregroundColor(.gray.opacity(0.6))
                    }
                }
                .background(.red)
            }
        }
        .background(.orange)
        .frame(width: 120, height: 185)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
