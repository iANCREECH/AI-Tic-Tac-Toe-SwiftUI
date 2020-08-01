//
//  Extensions.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import SwiftUI

// Color extension for custom 'off white' color
extension Color {
    static let offWhite = Color(red: 225/255, green: 225/255, blue: 235/255)
    static let endingDark = Color(red: 51/255, green: 60/255, blue: 65/255)
    static let beginningDark = Color(red: 26/255, green: 25/255, blue: 30/255)
}

// Gradient extension for custom shadow gradient
extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
