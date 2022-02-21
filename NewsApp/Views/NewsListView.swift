//
//  NewsListView.swift
//  NewsApp
//
//  Created by German Blonski on 16.02.2022.
//

import SwiftUI

struct NewsListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            if !listViewModel.articles.isEmpty {
                ScrollView {
                    VStack {
                        ForEach(listViewModel.articles, id: \.self) { item in
                            Button {
                                self.listViewModel.selectedArticle = item
                                withAnimation(.spring()) {
                                    self.listViewModel.showArticle = true
                                }
                            } label: {
                                if listViewModel.showArticle && listViewModel.selectedArticle == item{
                                    TempArticleRow(article: item)
                                } else {
                                    ArticleRowView(article: item, animation: animation)
                                }
                            }.buttonStyle(ArticleButtonStyle())
                        }
                    }
                }.background(Color(.systemGray6))
            } else {
                ZStack {
                    VStack(alignment: .center, spacing: 12) {
                        ProgressView()
                        Text("Loading")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .navigationTitle("NewsApp")
    }
}

struct NewsList_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        ContentView()
    }
}



