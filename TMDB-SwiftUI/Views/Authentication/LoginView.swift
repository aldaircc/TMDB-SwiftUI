//
//  LoginView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 23/07/22.
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
