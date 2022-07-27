//
//  RoundedButtonStyle.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 26/07/22.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, idealHeight: 16)
        .padding(5)
        .background(
            configuration.isPressed ? Color("Button background Pressed") : Color("Button background No Pressed")
        )
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 1)
                .fill(Color.gray.opacity(0.3))
        )
    }
}
