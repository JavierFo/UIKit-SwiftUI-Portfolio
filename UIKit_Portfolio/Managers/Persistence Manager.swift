//
//  Persistence Manager.swift
//  UIKit_Portfolio
//
//  Created by Javier FO on 16/06/25.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favourites = "favourites"
    }
    
    static func updateWith(favourite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void) {
        retrieveFavourites { result in
            switch result {
            case .success(let favourites):
                var retrievedFavs = favourites
                switch actionType {
                case .add:
                    guard !retrievedFavs.contains(favourite) else {
                        completed(.alreadyInFavs)
                        return
                    }
                    retrievedFavs.append(favourite)
                case .remove:
                    retrievedFavs.removeAll {
                        $0.login == favourite.login
                    }
                }
                
                completed(save(favourites: retrievedFavs))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavourites(completed: @escaping (Result<[Follower], GFError>) -> Void){
        guard let favouritesData = defaults.object(forKey: Keys.favourites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favourites = try decoder.decode([Follower].self, from: favouritesData)
            completed(.success(favourites))
        } catch {
            completed(.failure(.unableToFav))
        }
    }
    
    static func save(favourites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavourites = try encoder.encode(favourites)
            defaults.set(encodedFavourites, forKey: Keys.favourites)
            return nil
        } catch {
            return .unableToFav
        }
    }
}
