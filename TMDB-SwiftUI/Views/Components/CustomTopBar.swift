//
//  CustomTopBar.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 22/10/22.
//

import SwiftUI

struct CustomTopBar: View {
    let sectionName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(sectionName)
                    .padding(.trailing, 20)
                
                Button(action: { } ) {
                    Text("Posters")
                }
                
                Button(action: { } ) {
                    Text("Backdrops")
                        .underline(true, color: .green)
                        .fontWeight(.bold)
                }
                
                Button(action: { } ) {
                    Text("Logos")
                }
            }
            .background(.orange)
            
            /// Container View
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(maxHeight: 200)
            }
            .background(.red)
            
        }
    }
}

struct CustomTopBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTopBar(sectionName: "Media")
    }
}
