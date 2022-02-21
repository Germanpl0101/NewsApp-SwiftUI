//
//  ContentView.swift
//  NewsApp
//
//  Created by German Blonski on 16.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = ListViewModel()
    @Namespace var animation
    
    var body: some View {
        NavigationView {
            NewsListView(animation: animation)
                .environmentObject(model)
        }.navigationViewStyle(.stack)
            .overlay(
                ArticleDetailsView(animation: animation)
                    .environmentObject(model)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone13")
    }
}
