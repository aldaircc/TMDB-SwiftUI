//
//  CircularProgressView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 30/06/22.
//

import SwiftUI

struct CircularProgressView: View {
    
    @Binding var progress: Double
    
    var colors: (Color, Color) {
        return getColor(progress: progress)
    }
    
    var body: some View {
        ZStack {
            CircularBase()
            
            ProgressIndicator(progress: progress, pendingColor: colors.0, progressColor: colors.1)
            
            ProgressValue(progress: progress)
        }
        .frame(width: 34, height: 34)
    }
}

func getColor(progress: Double) -> (Color, Color) {
    switch progress {
    case 0..<40:
        return (Color("Low Pending Color"), Color("Low Progress Color"))
    case 40..<70:
        return (Color("Medium Pending Color"), Color("Medium Progress Color"))
    case 70...100:
        return (Color("High Pending Color"), Color("High Progress Color"))
    default: return (.clear, .clear)
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: .constant(50))
    }
}

struct CircularBase: View {
    var body: some View {
        Circle()
            .foregroundColor(Color("Circle Indicator Background"))
    }
}

struct ProgressValue: View {
    let progress: Double
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Text(String(format: "%.0f", progress))
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .fontWeight(.bold)
            Text("%")
                .font(.system(size: 5, weight: .semibold, design: .rounded))
        }
        .foregroundColor(Color("Text Progress Color"))
    }
}

struct ProgressIndicator: View {
    let progress: Double
    let pendingColor: Color
    let progressColor: Color
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 2)
            .padding(4)
            .foregroundColor(pendingColor)
        Circle()
            .trim(from: 0, to: progress/100)
            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
            .padding(4)
            .rotationEffect(.init(degrees: -90))
            .foregroundColor(progressColor)
    }
}
