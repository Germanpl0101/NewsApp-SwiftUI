//
//  News.swift
//  NewsApp
//
//  Created by German Blonski on 16.02.2022.
//

import Foundation

struct News : Codable, Hashable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
}
