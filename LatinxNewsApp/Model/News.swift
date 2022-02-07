//
//  News.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import Foundation

struct News: Decodable {
    var hits: [NewsStories]
}
