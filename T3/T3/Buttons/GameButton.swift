//
//  GameButton.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import SwiftUI

struct GameButton: View {
    let buttonAction: () -> Void
    let buttonText: Text
    
    init(action: @escaping () -> Void, @ViewBuilder content: () -> Text) {
        self.buttonAction = action
        self.buttonText = content()
    }
    
    var body: some View {
        Button(action: buttonAction) {
            buttonText
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.semibold)
                .frame(width: 65, height: 65)
                .foregroundColor(Color.black)
                .background(Color.gray)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                .shadow(color: Color.white, radius: 5, x: -5, y: -5)
                
        }
        .padding(EdgeInsets(top: 5, leading: 4, bottom: 5, trailing: 4))
    }
}


struct GameButton_Previews: PreviewProvider {
    static var previews: some View {
        GameButton(action: {}) { Text("X") }
        .background(
            RectangleCard(w: 100, h: 100, colorFill: .offWhite)
        )
    }
}



