//
//  CardView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 15/09/22.
//

import SwiftUI

struct CardView: View {
    
    let movieTitle, releaseDate: String
    let rateValue: Int
    
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
                            Text(verbatim: "\(rateValue)")
                                .font(.system(size: 11))
                                .fontWeight(.bold)
                            Text("%")
                                .font(.system(size: 5, weight: .semibold, design: .rounded))
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                    }
                    .frame(width: 30)
                    
                    VStack(alignment: .leading) {
                        Text(movieTitle)
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                        Text(releaseDate)
                            .font(.system(size: 10, weight: .thin))
                            .foregroundColor(.black.opacity(0.8))
                    }
                }
                .offset(x: 8, y: proxy.frame(in: .local).midY - 47)
            }
        }
        .frame(width: 120, height: 185)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(movieTitle: "Grey's Anatomy", releaseDate: "May 20, 2011", rateValue: 72)
    }
}
