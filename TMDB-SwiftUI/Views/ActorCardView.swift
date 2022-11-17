//
//  ActorCardView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 6/07/22.
//

import SwiftUI

struct ActorCardView: View {
    let cast: CastModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: cast.imagePath) { image in
                image.resizable()
                    .frame(width: 120, height: 180, alignment: .center)
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }

            ActorInformationBox(actorName: cast.name ?? "",
                                character: cast.character ?? "")
        }
    }
}

struct ActorCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActorCardView(cast: CastModel(adult: false, gender: 1, id: 1,
                                      knownForDepartment: nil, name: "Tom", originalName: "Tom",
                                      popularity: 8, profilePath: "/asdasd.jpg", castId: 1,
                                      character: "Tom Cruise", creditId: "1", order: 1))
    }
}

struct ActorInformationBox: View {
    let actorName: String
    let character: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(actorName)
                .font(.system(size: 7))
                .fontWeight(.bold)
            HStack {
                Text(character)
                    .font(.system(size: 7))
                .fontWeight(.thin)
                Spacer()
            }
            Spacer()
        }
        .frame(height: 35)
        .background(.white)
    }
}

struct ActorInformationBox_Previews: PreviewProvider {
    static var previews: some View {
        ActorInformationBox(actorName: "Aldair Cosetito", character: "iOS Engineer")
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        Text("xx")
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
