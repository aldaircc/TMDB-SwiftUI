//
//  LoginView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 23/07/22.
//

import SwiftUI

struct LoginView: View {
    @State var isEditing: Bool = false
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            
            Image("tmdbLogo")
                .resizable()
                .scaledToFit()
            
            TextField("Username", text: $userName) { value in
                _isEditing.wrappedValue = value
            }
            .textFieldStyle(RoundedTextFieldStyle(isEditing: isEditing))
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedTextFieldStyle(isEditing: isEditing))
            
            Spacer()
                .frame(maxHeight: 100)
            
            Button("Login") {
                ///To do
            }
            .buttonStyle(RoundedButtonStyle())
            
            Button("Reset password") {
                ///To do
            }
        }
        .background(Color.red)
        .padding(.horizontal)
        .ignoresSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
