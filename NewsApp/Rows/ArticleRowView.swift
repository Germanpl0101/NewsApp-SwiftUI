//
//  ArticleRowView.swift
//  NewsApp
//
//  Created by German Blonski on 16.02.2022.
//

import SwiftUI

struct ArticleRowView: View {
    
    var article: Article
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(article.title ?? "")
                        .font(.headline)
                }.padding(.horizontal, 8)
                AsyncImage(url: article.imageURL) { phase in
                    switch phase {
                    case .empty:
                        ZStack {
                            ProgressView()
                        }.frame(height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .failure:
                        EmptyView()
                    @unknown default:
                        fatalError()
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .clipped()
                Text(article.description ?? "")
                    .font(.body)
                    .padding(.horizontal, 8)
                HStack {
                    Spacer()
                    Text(article.publishedAt?.dateConvertion() ?? "")
                        .font(.caption)
                }.padding(.horizontal, 8)
            }.padding(.vertical)
        }
        .background(Color.white.shadow(color: Color(.systemGray4), radius: 1, x: 0, y: 0))
        .padding(.vertical, 6)
    }
    
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: Article.init())
            .previewLayout(.sizeThatFits)
    }
}


