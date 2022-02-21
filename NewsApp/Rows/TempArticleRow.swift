//
//  TempArticleRow.swift
//  NewsApp
//
//  Created by German Blonski on 21.02.2022.
//

import SwiftUI


struct TempArticleRow: View {
    
    @EnvironmentObject var model : ListViewModel
    
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(article.title ?? "")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .opacity(0)
            if let url = article.imageURL {
                CacheAsyncImage(url: url, content: { phase in
                    switch phase {
                    case .empty:
                        ZStack {
                            ProgressView()
                        }.frame(height: 200)
                            .opacity(0)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(0)
                    case .failure:
                        EmptyView()
                    @unknown default:
                        fatalError()
                    }
                }).frame(width: UIScreen.main.bounds.width)
            }
            
            Text(article.description ?? "")
                .font(.body)
                .padding(.horizontal, 8)
            
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .opacity(0)
            HStack {
                Spacer()
                Text(article.publishedAt?.dateConvertion() ?? "")
                    .font(.caption)
                    .opacity(0)
            }.padding(.horizontal, 8)
        }
        .padding(.vertical)
        .background(Color.white.shadow(color: Color(.systemGray4), radius: 1, x: 0, y: 0).opacity(0))
    }
    
}
