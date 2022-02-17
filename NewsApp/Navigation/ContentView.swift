//
//  ContentView.swift
//  NewsApp
//
//  Created by German Blonski on 16.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var service = ListViewModel()
    
    var body: some View {
        NavigationView {
            NewsListView()
                .environmentObject(service)
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone13")
    }
}
