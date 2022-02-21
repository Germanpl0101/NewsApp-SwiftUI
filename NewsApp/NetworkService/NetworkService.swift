//
//  NewsService.swift
//  NewsApp
//
//  Created by German Blonski on 16.02.2022.
//

import Foundation

protocol NewsServiceProtocol {
    var data : News { get }
    func fetchNews() async throws -> News
}

class NetworkService: ObservableObject, NewsServiceProtocol {
    
    private let key = "6077a98e4f674d28a5ac3c926511861c"
    
    @Published var data = News()
    
    private let session = URLSession(configuration: .default)
    
    init()  {
        self.downloadNews()
    }
   
    func downloadNews() {
        Task {
            self.data = try await fetchNews()
        }
    }
    
    func fetchNews() async throws -> News {
        
        let (data, response) = try await session.data(from: generatePathURL())
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NewsError.invalidServerError
        }
        
        let news = try JSONDecoder().decode(News.self, from: data)
        return  news
    }
    
    private func generatePathURL() -> URL {
        var path = "https://newsapi.org/v2/everything?q=tesla&from=2022-02-16&sortBy=publishedAt&apiKey="
        path += key
        path += "&language=en"
        guard let url =  URL(string: path) else { fatalError("Bad URL") }
        return url
    }
    
}

