//
//  MovieInfoView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 22/11/22.
//

import SwiftUI

struct MovieInfoView: View {
    let fieldTitle: String
    let fieldValue: String
    let isCurrencyFormat: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fieldTitle)
                .fontWeight(.bold)
            
            if isCurrencyFormat {
                Text(Int(fieldValue) ?? 0, format: .currency(code: "USD"))
            } else {
                Text(fieldValue)
            }
        }
    }
}

struct MovieInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfoView(fieldTitle: "", fieldValue: "", isCurrencyFormat: false)
    }
}
