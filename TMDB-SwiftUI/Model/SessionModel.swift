//
//  SessionModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 18/07/22.
//

import Foundation

struct SessionModel: Codable {
    let success: Bool
    let sessionId: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }
}
