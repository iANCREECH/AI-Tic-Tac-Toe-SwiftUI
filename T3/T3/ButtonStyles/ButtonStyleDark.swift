//
//  ButtonStyleDark.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import SwiftUI

struct BackgroundDark<S: Shape>: View {
    var highlighted: Bool
    var theShape : S
    
    var body: some View {
        ZStack {
            if highlighted {
                theShape
                    .fill(Color.endingDark)
                    .shadow(color: Color.beginningDark, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.endingDark, radius: 10, x: -5, y: -5)
            } else {
                theShape
                    .fill(Color.endingDark)
                    .shadow(color: Color.beginningDark, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.endingDark, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct ButtonStyleDark: ButtonStyle {
    let cornerRadius: CGFloat = 10
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .padding(30)
            .contentShape(RoundedRectangle(cornerRadius: cornerRadius))
        .background(
            BackgroundDark(highlighted: configuration.isPressed, theShape: RoundedRectangle(cornerRadius: cornerRadius))
        )
    }
}
