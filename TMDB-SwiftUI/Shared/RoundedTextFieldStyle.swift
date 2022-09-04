//
//  RoundedTextFieldStyle.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 26/07/22.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    var isEditing: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        return configuration
            .padding(
                EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .fill(Color(isEditing ? "TextField Border Color On Focus" : "TextField Border Color Lost Focus"))
            )
    }
}
