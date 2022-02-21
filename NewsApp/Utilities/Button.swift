//
//  Button.swift
//  NewsApp
//
//  Created by German Blonski on 21.02.2022.
//

import SwiftUI

struct ArticleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
    }
}
