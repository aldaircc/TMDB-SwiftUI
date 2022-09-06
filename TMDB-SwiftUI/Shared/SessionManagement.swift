//
//  SessionManagement.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 6/09/22.
//

import Foundation

struct SessionManagement {
    static let shared = SessionManagement()
    
    var apiKey: String?
    var sessionId: String?
    var expiresAt: String?
    
    
    func validationSession() -> Bool {
        return true
    }
    
    mutating func saveApiKey(_ value: String) {
        self.apiKey = value
    }
    
    mutating func saveSession(_ value: String) {
        self.sessionId = value
    }
    
    mutating func saveExpiresAt(_ value: String) {
        self.expiresAt = value
    }
}
