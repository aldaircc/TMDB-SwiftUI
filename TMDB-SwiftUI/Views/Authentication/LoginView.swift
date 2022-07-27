//
//  LoginView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 23/07/22.
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

struct LoginView: View {
    @State var isEditing: Bool = false
    var body: some View {
        VStack {
            TextField("Username", text: .constant("")) { value in
                _isEditing.wrappedValue = value
            }
            .textFieldStyle(RoundedTextFieldStyle(isEditing: isEditing))
            
            SecureField("Password", text: .constant(""))
            
            Button("Login") {
                ///To do
            }
            .buttonStyle(RoundedButtonStyle())
            
            Button("Reset password") {
                ///To do
            }
        }
        .padding(.horizontal)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
