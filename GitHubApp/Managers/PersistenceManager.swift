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
    
    
    static func updateWith(favorite: Followers, actionType: PersistenceActionType, completionHandler: @escaping (GHError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .failure(let error):
                completionHandler(error)
            case .success(var favorites):
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completionHandler(.favoriteAlreadyExists)
                        return
                    }
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll() { $0.login == favorite.login }
                }
                completionHandler(save(favorites: favorites))
            }
        }
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
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completionHandler(.success([]))
            return
        }
        
        do {
            let jsonDecoder = JSONDecoder()
            let favorites = try jsonDecoder.decode([Followers].self, from: favoritesData)
            completionHandler(.success(favorites))
        } catch {
            completionHandler(.failure(.unableToRetrieveFavorites))
        }
    }
    
    static func checkExistence(of favorite: Followers, completionHandler: @escaping (Bool) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                completionHandler(favorites.contains(favorite))
            case .failure:
                completionHandler(false)
            }
            
        }
    }
    
    
    
}


    





