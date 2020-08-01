//
//  MenuButtonStyle.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import SwiftUI

// Global constant ofr corner radius of rounded rectangle
let cornerRadius: CGFloat = 20

struct MenuButtonStyle: ButtonStyle {
    var blurRadius: CGFloat = 4
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.offWhite)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: blurRadius)
                                    .offset(x: 2, y: 2)
                                    .mask(RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(Color.black, Color.clear)))
                            )
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(Color.white, lineWidth: 8)
                                .blur(radius: blurRadius)
                                .offset(x: -2, y: -2)
                            .mask(RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(Color.clear, Color.black)))
                        )
                    } else {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white, radius: 15, x: -10, y: -10)
                    }
                })
    }
}
