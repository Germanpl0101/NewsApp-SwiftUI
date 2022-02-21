//
//  CacheAsyncImage.swift
//  NewsApp
//
//  Created by German Blonski on 20.02.2022.
//

import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View{
    
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(url: URL, scale: CGFloat = 1.0, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View {
        if let cachedImage = ImageCache[url] {
            content(.success(cachedImage))
        } else {
            AsyncImage(url: url, scale: scale, transaction: transaction) { phase in
                rendering(phase: phase)
            }
        }
    }
    
    func rendering(phase: AsyncImagePhase) -> some View {
        
        if case .success (let image) = phase {
            ImageCache[url] = image
        }
        
        return content(phase)
    }
}

fileprivate class ImageCache {
    
    static private var cache: [URL: Image] = [:]
    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
