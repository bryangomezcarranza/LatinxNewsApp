//
//  NewsStories.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import Foundation

struct NewsStories: Codable {
    let title: String
    let url: String
    let author: String
    let comments: Int
    let points: Int
}
