//
//  PersistenceManager.swift
//  WineFinderApp
//
//  Created by iain Allen on 28/01/2021.
//

import Foundation

enum PersistenceActionType  {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    
    static func update(favorite: Wine, actionType: PersistenceActionType, completed: @escaping (WFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrieveFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrieveFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    retrieveFavorites.append(favorite)
                    
                case .remove:
                    retrieveFavorites.removeAll {  $0.wineName == favorite.wineName }
                }
                completed(save(favorites:  retrieveFavorites))
               
            case .failure(let error):
                completed(error)
                
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Wine], WFError>) -> Void) {
        guard let wineListData = defaults.object(forKey: Keys.favorites) as? Data else  {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let wineList = try decoder.decode([Wine].self, from: wineListData)
            completed(.success(wineList))
            
        } catch {
            completed(.failure(.unableToAdd))
        }
        
        
    }
    
    static func save(favorites: [Wine]) -> WFError? {
        
        do {
            let encoder = JSONEncoder()
            let encodedWineList = try encoder.encode(favorites)
            defaults.set(encodedWineList, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToAdd
        }
    }
}

