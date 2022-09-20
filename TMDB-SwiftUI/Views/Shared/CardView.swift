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
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    ZStack(alignment: .center) {
                        Circle()
                        Circle()
                            .trim(from: 0.0, to: 0.5)
                            .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle.degrees(-90))
                            .foregroundColor(.orange)
                            .padding(2.5)
                        
                        HStack(alignment: .top, spacing: 0) {
                            Text("10")
                                .font(.system(size: 10))
                            Text("%")
                                .font(.system(size: 6, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(.white)
                    }
                    .frame(width: 30)
                    
                    VStack {
                        Text("My favorite movie")
                        Text("Release date")
                            .font(.system(size: 11, weight: .thin))
                            .foregroundColor(.gray.opacity(0.6))
                    }
                }
                .offset(x: 8, y: proxy.frame(in: .local).midY - 14)
                .background(.clear)
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
