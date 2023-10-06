//
//  PressableButtonStyle.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/09/16.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    let scaledAmount: CGFloat

    init(scaledAmount: CGFloat = 0.9) {
        self.scaledAmount = scaledAmount
    }
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    func withPressableStyle(_ scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}
