//
//  CardView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 15/09/22.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("greysAnatomy")
                .resizable()
                .frame(width: 120, height: 185)
                .cornerRadius(9)
            
            Circle()
                .trim(from: 0.2, to: 1.0)
                .frame(width: 30)
            Text("My favorite movie")
            Text("Release date")
                .font(.system(size: 11, weight: .thin))
                .foregroundColor(.gray.opacity(0.6))
//                .offset(x: 10, y: 50)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
