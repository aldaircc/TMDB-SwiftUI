//
//  LinkButtonStyle.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 28/07/22.
//

import SwiftUI

struct LinkButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textCase(.lowercase)
            .background {
                Rectangle()
                    .fill(.blue)
                    .frame(height: 1)
            }
    }
}
