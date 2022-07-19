//
//  SessionModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 18/07/22.
//

import Foundation

struct SessionModel: Codable {
    let success: Bool
    let guestSessionId, expiresAt: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case guestSessionId = "guest_session_id"
        case expiresAt = "expires_at"
    }
}
