//
//  PersistanceManager.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 3/14/22.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistanceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let savedNews = "savedNews"
    }
    
    // this function conbines a add and delete/remove together by simply switching for ActionType.
    static func updateWith(news: NewsStory, actionType: PersistenceActionType, completion: @escaping (APIError?) -> Void) {
        
        retrieveFavorites { result in
            switch result {
                // get News
            case .success(var newsSaved):
                
                switch actionType {
                case .add:
                    // check first to see if the news you are adding is not there already. If its not it proceeds to add them.
                    guard !newsSaved.contains(news) else {
                        completion(.alreadySaved)
                        return
                    }
                    
                    newsSaved.append(news)
                    
                case .remove:
                    newsSaved.removeAll(where: {$0.title == news.title})
                }
                // save it now. 
                completion(save(news: newsSaved))
            case .failure(let error):
                completion(error)
            }
        }
    }
    
 //MARK: - Local Persistance
    static func retrieveFavorites(completed: @escaping (Result<[NewsStory], APIError>) -> Void) {
        guard let savedData = defaults.object(forKey: Keys.savedNews) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let savedNews = try decoder.decode([NewsStory].self, from: savedData)
            completed(.success(savedNews))
        } catch {
            completed(.failure(.unableToSave))
        }
    }
    
    static func save(news: [NewsStory]) -> APIError? {
        do {
           let encoder = JSONEncoder()
            let encodedSavedNews = try encoder.encode(news)
            defaults.set(encodedSavedNews, forKey: Keys.savedNews)
            return nil
        } catch {
            return .unableToSave
        }
    }
}
