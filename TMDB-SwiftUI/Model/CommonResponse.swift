//
//  CommonResponse.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 22/07/22.
//

import Foundation

struct CommomResponse: Codable {
    let success: Bool
    let statusCode: Int
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
