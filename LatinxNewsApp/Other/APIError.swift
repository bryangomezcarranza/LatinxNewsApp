//
//  APIError.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/8/22.
//

import Foundation

enum APIError: String, Error {
    case noDataReturned = "Unable to access data from Server"
    case invalidURL = "Invalid URL from the server. Please check URL"
    case unableToSave = "There was an error saving this user. Please try again"
    case alreadySaved = "This has been saved already! You can only save ones"
}
