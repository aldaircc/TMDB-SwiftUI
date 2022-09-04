//
//  RequestTokenModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 20/07/22.
//

import Foundation

struct TokenModel: Codable {
    let success: Bool
    let expiresAt: String
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
