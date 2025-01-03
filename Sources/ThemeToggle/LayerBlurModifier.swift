//
//  LayerBlurModifier.swift
//  ThemeToggle
//
//  Created by Arek on 03/01/2025.
//

import SwiftUI

struct LayerBlurModifier: ViewModifier {

    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(radius)
            .background(
                content
                    .blur(radius: radius)
            )
    }
}
