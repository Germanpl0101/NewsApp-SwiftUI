//
//  ListViewModel.swift
//  NewsApp
//
//  Created by German Blonski on 16.02.2022.
//

import Foundation

class ListViewModel: ObservableObject {
    
    private var service : NetworkService
    @Published var articles = [Article]()
    
    @Published var showArticle: Bool = false
    @Published var selectedArticle: Article?
    
    init() {
        self.service = NetworkService()
        
        service.$data
            .map{ $0.articles ?? [] }
            .receive(on: OperationQueue.main)
            .assign(to: &$articles)
    }

}
