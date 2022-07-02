//
//  CircularProgressView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 30/06/22.
//

import SwiftUI

struct CircularProgressView: View {
    
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            CircularBase()
            
            Circle()
                .stroke(lineWidth: 2)
                .padding(4)
                .foregroundColor(Color("High Pending Color"))
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                .padding(4)
                .rotationEffect(.init(degrees: -90))
                .foregroundColor(Color("High Progress Color"))
            
            HStack(alignment: .top, spacing: 0) {
                Text("50")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .fontWeight(.bold)
                Text("%")
                    .font(.system(size: 5, weight: .semibold, design: .rounded))
            }
            .foregroundColor(Color("Text Progress Color"))
        }
        .frame(height: 34)
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: .constant(0.5))
    }
}

struct CircularBase: View {
    var body: some View {
        Circle()
            .foregroundColor(Color("Circle Indicator Background"))
    }
}
