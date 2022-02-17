//
//  NewsStories.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import Foundation

struct NewsStories: Codable {
    
    let title: String
    let url: String?
    let author: String
    let points: Int
    let numberOfComments: Int
    let datePosted: String
    
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case url = "url"
        case author = "author"
        case points = "points"
        case numberOfComments = "num_comments"
        case datePosted = "created_at"
     
    }
}

