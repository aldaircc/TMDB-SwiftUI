//
//  SessionManagement.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 6/09/22.
//

import Foundation

struct SessionManagement {
    static var shared = SessionManagement()
    
    var tokenKey: String?
    var sessionId: String?
    var expiresAt: String?
    
    
    func validationSession() -> Bool {
        return true
    }
    
    mutating func saveTokenKey(_ value: String) {
        self.tokenKey = value
    }
    
    mutating func saveSession(_ value: String) {
        self.sessionId = value
    }
    
    mutating func saveExpiresAt(_ value: String) {
        self.expiresAt = value
    }
}
