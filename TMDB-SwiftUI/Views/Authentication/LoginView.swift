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
        }
        .padding(.horizontal)
        .background(Color.yellow)
        .cornerRadius(9)
        .overlay(
            RoundedRectangle(cornerRadius: 9)
                .stroke(lineWidth: 6)
                .shadow(color: .red, radius: 10, x: 1, y: 1)
        )
    }
}

struct LoginView: View {
    var body: some View {
        VStack {
            
            TextField("Username", text: .constant(""))
            
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
