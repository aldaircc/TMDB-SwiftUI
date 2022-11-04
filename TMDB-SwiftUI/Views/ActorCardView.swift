//
//  ActorCardView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 6/07/22.
//

import SwiftUI

struct ActorCardView: View {
    let name: String
    let character: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("tom_cruise")
                .resizable()
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
            
            ActorInformationBox(actorName: name, character: character)
        }
        .frame(width: 100, height: 250)
    }
}

struct ActorCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActorCardView(name: "Gillian Jacobs", character: "Brianne")
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
