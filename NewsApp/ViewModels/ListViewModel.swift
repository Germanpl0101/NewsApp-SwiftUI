//
//  ListViewModel.swift
//  NewsApp
//
//  Created by German Blonski on 16.02.2022.
//

import Foundation


class ListViewModel: ObservableObject {
    
    private var service : NewsService
    @Published var articles = [Article]()
    
    init() {
        self.service = NewsService()
        service.$data
            .map{ $0.articles ?? [] }
            .receive(on: DispatchQueue.main)
            .assign(to: &$articles)
    }
    
}
