//
//  LoginView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 23/07/22.
//

import SwiftUI

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
