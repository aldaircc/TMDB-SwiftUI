//
//  LoginView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 23/07/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var vm = AuthenticationViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                
                Image("tmdbLogo")
                    .resizable()
                    .scaledToFit()
                
                TextField("Username", text: $vm.userName) { value in
                    vm.isEditing = value
                }
                .textFieldStyle(RoundedTextFieldStyle(isEditing: vm.isEditing))
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                
                SecureField("Password", text: $vm.password)
                    .textFieldStyle(RoundedTextFieldStyle(isEditing: vm.isEditing))
                
                Spacer()
                    .frame(maxHeight: 100)
                
                Button("Login") {
                    Task {
                        await vm.authenticateUser()
                    }
                }
                .disabled(vm.userName.isEmpty || vm.password.isEmpty)
                .buttonStyle(RoundedButtonStyle(isActive: .constant(!vm.userName.isEmpty && !vm.password.isEmpty)))
                
                NavigationLink("", isActive: $vm.isAuthenticated) {
                    HomeView()
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
