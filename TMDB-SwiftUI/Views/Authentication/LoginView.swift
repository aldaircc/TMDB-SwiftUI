//
//  LoginView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 23/07/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authenticationVM = AuthenticationViewModel()
    @State var isEditing = false
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                
                Image("tmdbLogo")
                    .resizable()
                    .scaledToFit()
                
                TextField("Username", text: $userName) { value in
                    _isEditing.wrappedValue = value
                }
                .textFieldStyle(RoundedTextFieldStyle(isEditing: isEditing))
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedTextFieldStyle(isEditing: isEditing))
                
                Spacer()
                    .frame(maxHeight: 100)
                
                Button("Login") {
                    Task {
                        await authenticationVM.authenticateUser(userName: userName,
                                                          password: password)
                    }
                }
                .disabled(userName.isEmpty || password.isEmpty)
                .buttonStyle(RoundedButtonStyle(isActive: .constant(!userName.isEmpty && !password.isEmpty)))
                
                NavigationLink("", isActive: $authenticationVM.isAuthenticated) {
                    ContentView()
                }
                
                Button("Reset password") {
                    ///To do
                }
                .buttonStyle(LinkButtonStyle())
            }
            .padding(.horizontal)
        .ignoresSafeArea(.all)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
