//
//  CustomTopBar.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 22/10/22.
//

import SwiftUI

struct CustomTopBar: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Name")
            }
            .background(.orange)
            
            
        }
    }
}

struct CustomTopBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTopBar()
    }
}
