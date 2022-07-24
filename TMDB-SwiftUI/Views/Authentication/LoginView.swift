//
//  LoginView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 23/07/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            
            TextField("Username", text: .constant(""))
            SecureField("Password", text: .constant(""
                                                   ))
            Button("Login") {
                ///To do
            }
            
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
