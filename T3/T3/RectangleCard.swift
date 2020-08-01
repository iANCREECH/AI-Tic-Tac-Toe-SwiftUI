//
//  RectangleCard.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import SwiftUI

struct RectangleCard: View {
    var w: CGFloat
    var h: CGFloat
    var colorFill: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
        .fill(colorFill)
        .frame(width: w, height: h)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
        .shadow(color: Color.white, radius: 15, x: -10, y: -10)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard(w: 300, h: 200, colorFill: .offWhite)
    }
}
