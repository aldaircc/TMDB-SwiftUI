//
//  AuthenticationViewModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 30/07/22.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    
    let network: Network
    @Published var isAuthenticated = false
    @Published var isEditing = false
    @Published var userName = ""
    @Published var password = ""
    
    init(_ network: Network = Network()) {
        self.network = network
    }
    
    func authenticateUser() async {
        do {
            let result = try await network.startLoginProcess(username: userName, password: password)
            DispatchQueue.main.async {
                self.isAuthenticated = (result != nil)
            }
        } catch {
            fatalError("Authentication error: \(error.localizedDescription)")
        }
    }
}
