//
//  CastView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 23/11/22.
//

import SwiftUI

struct CastView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image("tom_cruise")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text("Name")
                        .fontWeight(.semibold)
                    Text("Character")
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

struct CastView_Previews: PreviewProvider {
    static var previews: some View {
        CastView()
    }
}
