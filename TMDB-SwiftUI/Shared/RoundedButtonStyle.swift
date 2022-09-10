//
//  RoundedButtonStyle.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 26/07/22.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    @Binding var isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, idealHeight: 25)
        .padding(5)
        .background(
            isActive ? configuration.isPressed ? Color("Button background Pressed") : Color("Button background No Pressed") : Color.red
        )
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 1)
                .fill(Color.gray.opacity(0.3))
        )
    }
}
