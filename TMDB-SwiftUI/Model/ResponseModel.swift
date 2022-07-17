//
//  ResponseModel.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 17/07/22.
//

import Foundation

struct ResponseModel: Codable {
    let statusCode: Int
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
