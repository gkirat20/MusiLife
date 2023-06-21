//
//  APIServices.swift
//  MusiLife
//
//  Created by Kirat Gill on 2023-06-18.
//

import Foundation

class APIServices {
    
    static let shared = APIServices()
    
    func createAccessTokenRequest() -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = APIElements.authenticationHost
        urlComponents.path = "/authorize"
        
        urlComponents.queryItems = APIElements.authenticationParams.map({URLQueryItem(name: $0, value: $1)})
        
        guard let url = urlComponents.url else { return nil }
        
        return URLRequest(url: url)
    }
    
    func createSearchURLRequest() -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = APIElements.apiHost
        urlComponents.path = "/v1/search"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "type", value: "track"),
            URLQueryItem(name: "query", value: "taylor swift")
        ]
        
        guard let url = urlComponents.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        
        guard let token = UserDefaults.standard.string(forKey: "Authorization") else { return nil }
        urlRequest.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpMethod = "GET"
        
        return urlRequest
    }

    
    func searchSongs() async throws -> [String] {
        guard let urlRequest = createSearchURLRequest() else { throw NetworkError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(Response.self, from: data)
        
        let items = searchResponse.tracks.items
        
        let songNames = items.map({ $0.name })
        return songNames
    }
       
       
   }

   struct Response: Codable {
       let tracks: Track
   }

   struct Track: Codable {
       let items: [Item]
   }

   struct Item: Codable {
       let name: String
   }
