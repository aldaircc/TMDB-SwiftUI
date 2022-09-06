//
//  GuestSessionResponse.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 21/07/22.
//

import Foundation

struct GuestSessionResponse: Codable {
    let success: Bool
    let expiresAt: String
    let guestSessionId: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case guestSessionId = "guest_session_id"
    }
}
