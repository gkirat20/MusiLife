//
//  APIElements.swift
//  MusiLife
//
//  Created by Kirat Gill on 2023-06-18.
//

import Foundation

enum APIElements {
    static let apiHost = "api.spotify.com"
    static let authenticationHost = "accounts.spotify.com"
    static let clientId = "f679e6b758e9f46a097243d12267bb67e"
    static let clientSecret = "ef01f5a4eb0044de9bbe3d9ca15eb158"
    static let redirectUri = "http://localhost:2000"
    static let responseType = "token"
    static let scopes = "user-read-private"
   
    static var authenticationParams = [
        "response_type": responseType,
        "client_id": clientId,
        "redirect_uri": redirectUri,
        "scope": scopes
    ]
}
