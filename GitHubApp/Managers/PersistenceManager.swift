//
//  persistenceManager.swift
//  GitHubApp
//
//  Created by Rafael Levy on 8/20/21.
//

import Foundation

enum PersistenceActionType {
    case add
    case remove
}


enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func save(favorites:[Followers]) -> GHError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToSave
        }
    }
    
    static func retrieveFavorites(completionHandler: @escaping (Result<[Followers], GHError>) -> Void ) {
        
    }
}


    





