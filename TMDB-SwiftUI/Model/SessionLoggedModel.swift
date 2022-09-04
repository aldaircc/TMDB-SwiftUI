//
//  SessionLoggedModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 20/07/22.
//

import Foundation

struct SessionLoggedModel: Codable {
    
    let username, password, requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case password = "password"
        case requestToken = "request_token"
    }
}

struct SessionLoginResponse: Codable {
    let success: Bool
    let expiresAt: String
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
