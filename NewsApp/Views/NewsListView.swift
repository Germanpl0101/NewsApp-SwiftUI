//
//  NewsListView.swift
//  NewsApp
//
//  Created by German Blonski on 16.02.2022.
//

import SwiftUI

struct NewsListView: View {
    
    @EnvironmentObject var news : ListViewModel
    
    var body: some View {
        ZStack {
            if !news.articles.isEmpty {
                ScrollView {
                    VStack {
                        ForEach(news.articles, id: \.self) { item in
                            ArticleRowView(article: item)
                        }
                    }
                }.background(Color(.systemGray6))
            } else {
                ZStack {
                    ProgressView()
                }
            }
        } .navigationTitle("NewsApp")
    }
}


struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        NewsListView()
            .environmentObject(ListViewModel())
        }
    }
}
