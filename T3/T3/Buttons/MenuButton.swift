//
//  MenuButton.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
    let action: () -> Void
    let buttonContent: Text
    
    init(action: @escaping () -> Void, @ViewBuilder content: () -> Text) {
        self.action = action
        self.buttonContent = content()
    }
    
    var body: some View {
        Button(action: action) {
            buttonContent
                .fontWeight(.semibold)
                .frame(minWidth: 120, maxWidth: 120)
                .foregroundColor(Color.black)
        }.buttonStyle(MenuButtonStyle())
    }
}


struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(action: {}) { Text("Menu Button") }
    }
}

