//
//  CardView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 15/09/22.
//

import SwiftUI

struct CardView: View {
    let movieTitle: String
    let releaseDate: Date
    let rateValue: Double
    let imageUrl: URL
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                } placeholder: {
                    Image(systemName: "play.fill")
                }
                .frame(width: 120, height: 185)
                .cornerRadius(9)

                VStack(alignment: .leading, spacing: 5) {
                    
                    CircleProgressView(rateValue: rateValue)
                    
                    MovieDetailView(title: movieTitle, releaseDate: releaseDate)
                }
                .offset(x: 8, y: proxy.frame(in: .local).midY - 47)
            }
        }
        .frame(width: 120, height: 185)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(movieTitle: "Grey's Anatomy", releaseDate: Date(), rateValue: 72, imageUrl: URL(string: "https://www.themoviedb.org/t/p/w220_and_h330_face/1HOYvwGFioUFL58UVvDRG6beEDm.jpg")!)
    }
}

struct CircleProgressView: View {
    
    var rateValue: Double = 0.0
    var rateFormatted: String {
        return String(format: "%.0f", (rateValue * 10))
    }
    var colors: (Color, Color) {
        return Color.getColor(progress: rateValue)
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .foregroundColor(colors.0)
            Circle()
                .trim(from: 0.0, to: rateValue/10)
                .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle.degrees(-90))
                .foregroundColor(colors.1)
                .padding(2.5)
            
            HStack(alignment: .top, spacing: 0) {
                Text(rateFormatted)
                    .font(.system(size: 11))
                    .fontWeight(.bold)
                Text("%")
                    .font(.system(size: 5, weight: .semibold, design: .rounded))
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
        }
        .frame(width: 30)
    }
}

struct MovieDetailView: View {
    let title: String
    let releaseDate: Date
    
    var dateString: String {
        let formatter =  DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: releaseDate)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 11))
                .fontWeight(.bold)
            Text(dateString)
                .font(.system(size: 10, weight: .thin))
                .foregroundColor(.black.opacity(0.8))
        }
    }
}

extension Color {
    static func getColor(progress: Double) -> (Color, Color) {
        switch progress {
        case 0..<0.4:
            return (Color("Low Pending Color"), Color("Low Progress Color"))
        case 0.4..<0.7:
            return (Color("Medium Pending Color"), Color("Medium Progress Color"))
        case 0.7...1:
            return (Color("High Pending Color"), Color("High Progress Color"))
        default: return (.clear, .clear)
        }
    }
}
