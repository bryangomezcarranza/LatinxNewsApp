//
//  NetworkManager.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/8/22.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseUrl = "http://hn.algolia.com/api/v1/"
    private let stories = "story"
    
    
    func news(completion: @escaping (Result<News, Error>) -> Void) {
        let query = "Latinos in tech"
        guard let safeQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        request(url: url(for: .search, queryParams: ["query" : safeQuery]), expecting: News.self, completion: completion)
    }
    
    //MARK: - Private
    
    private enum Endpoint: String {
        case search
    }
    
    private func url(for endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
        var urlString = baseUrl + endpoint.rawValue
        var queryItems = [URLQueryItem]()
        
        // Add any parameteres to URL
        for (name, value) in queryParams {
            queryItems.append(URLQueryItem(name: name, value: value))
        }
        // Add Token
        queryItems.append(URLQueryItem(name: "tags", value: stories))
        
        // Convert queri items in suffix string
        let queryString = queryItems.map { "\($0.name)=\($0.value ?? "")"}.joined(separator: "&")
        urlString += "?" + queryString
        
        print("\n\(urlString)\n")
        return URL(string: urlString)
    }

    
    private func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil  else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturned))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
