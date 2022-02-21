//
//  Article.swift
//  NewsApp
//
//  Created by German Blonski on 17.02.2022.
//

import Foundation

struct Article: Identifiable, Codable, Hashable {
    
    var id = UUID()
    
    var source: NewsSource?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    var imageURL: URL? {
        guard let url = urlToImage else { return nil }
        return URL(string: url)
    }
    
    init() {
        self.source = NewsSource(id: "1", name: "AutoExpress")
        self.title = "The Midlands continues to be a hotbed of engineering talent"
        self.author = "Steve Fowler"
        self.description = "Steve Fowler highlights how the UK is a leader for automotive engineering"
        self.url = "https://www.autoexpress.co.uk/opinion/357375/midlands-continues-be-hotbed-engineering-talent"
        self.urlToImage = "https://media.autoexpress.co.uk/image/private/s--X-WVjvBW--/f_auto,t_content-image-full-desktop@1/v1645030032/autoexpress/2022/02/Opinion_UK_engineering.jpg"
        self.publishedAt = "2022-02-16T20:54:09Z"
        self.content = "We're unashamedly proud of the UKs car industry here at Auto Express. When it comes to making cars, we Brits are as good as anyone around the world. And as we highlighted just a few issues ago, luxur… [+1752 chars]"
    }
    
    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }
}
