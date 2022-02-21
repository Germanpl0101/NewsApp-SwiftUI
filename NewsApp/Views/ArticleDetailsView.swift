//
//  ArticleDetailsView.swift
//  NewsApp
//
//  Created by German Blonski on 18.02.2022.
//

import SwiftUI

struct ArticleDetailsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var showingData = false
    var animation: Namespace.ID
    
    var body: some View {
        if let article = listViewModel.selectedArticle, listViewModel.showArticle {
            ScrollView(.vertical) {
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
                    VStack(spacing: 12) {
                        Text(article.description ?? "")
                            .font(.body)
                            .padding(.horizontal, 8)
                            .matchedGeometryEffect(id: "Text - \(article.id)", in: animation)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        Divider()
                        Text(article.publishedAt?.dateConvertion() ?? "")
                            .font(.caption)
                            .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
                            .opacity(showingData ? 1 : 0)
                            .animation(.spring(), value: self.showingData)
                        Text(article.author ?? "")
                            .font(.caption)
                            .fontWeight(.bold)
                            .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
                            .opacity(showingData ? 1 : 0)
                            .animation(.spring(), value: self.showingData)
                    }.padding(.vertical)
                }
            }
            .background(colorScheme == .light ? Color.white : Color.black)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) { showingData = true }
            }
            .onDisappear { showingData = false }
            .overlay(
                ZStack {
                    Button(action: {
                        withAnimation(.spring()) {
                            self.listViewModel.showArticle = false
                            self.listViewModel.selectedArticle = nil
                        }
                    }, label: {
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                            .padding()
                    })
                }, alignment: .bottomTrailing
            )
        }
    }
}
