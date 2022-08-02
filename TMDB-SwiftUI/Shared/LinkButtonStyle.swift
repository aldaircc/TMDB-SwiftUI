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
            .foregroundColor(.blue)
            .background {
                Rectangle()
                    .fill( configuration.isPressed ? .blue : .clear)
                    .frame(height: 1)
                    .offset(x: 0, y: 8)
            }
    }
}
