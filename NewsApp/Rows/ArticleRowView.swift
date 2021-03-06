//
//  ArticleRowView.swift
//  NewsApp
//
//  Created by German Blonski on 16.02.2022.
//

import SwiftUI

struct ArticleRowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var article: Article
    
    var animation: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(article.title ?? "")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .matchedGeometryEffect(id: "Title - \(article.id)", in: animation)
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            
            if let url = article.imageURL {
                CacheAsyncImage(url: url, content: { phase in
                    switch phase {
                    case .empty:
                        ZStack {
                            ProgressView()
                        }.frame(height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .matchedGeometryEffect(id: "Image - \(article.id)", in: animation)
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
                .matchedGeometryEffect(id: "Text - \(article.id)", in: animation)
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            HStack {
                Spacer()
                Text(article.publishedAt?.dateConvertion() ?? "")
                    .font(.caption)
            }.padding(.horizontal, 8)
            
        }
        .padding(.vertical)
        .background(colorScheme == .light ?  Color.white : Color.black)
        .shadow(color: Color(.systemGray4), radius: 1, x: 0, y: 0)
    }
    
}

struct ArticleRowView_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        Group {
            ContentView()
                .colorScheme(.light)
            ContentView()
                .colorScheme(.dark)
        }
    }
}
