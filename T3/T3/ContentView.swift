//
//  ContentView.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userSelection: String? = nil
    
    var body: some View {
       NavigationView {
        
        ZStack {
                
                Color.offWhite.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    
                    Text("TicTacToe")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .background(RectangleCard(w: 250, h: 150, colorFill: .offWhite), alignment: .center)
                        .padding(.bottom, 50)
                        .padding(.horizontal, 20)
                    
                    // Nav to Two Player
                    NavigationLink(destination: TwoPlayerView(), tag: "PVP", selection: $userSelection) { EmptyView() }
                    // Nav to Single player
                    NavigationLink(destination: SinglePlayerView(), tag: "PVC", selection: $userSelection) { EmptyView() }
                    // Nav to about page
                    NavigationLink(destination: AboutView(), tag: "Abt", selection: $userSelection) { EmptyView() }
                    // Nav to settings page
                    NavigationLink(destination: SettingsView(), tag: "Set", selection: $userSelection) { EmptyView() }
    
                    // Takes user to TwoPlayerView
                    MenuButton(action: { self.userSelection = "PVP" }) { Text("Two Player") }
                    
                    // Takes user to SingplePlayerView
                    MenuButton(action: { self.userSelection = "PVC" }) { Text("Single Player") }
                    
                    // Takes user to AboutView
                    MenuButton(action: { self.userSelection = "Abt"}) { Text("About the App") }
                    
                    // Takes user to SettingsView
                    MenuButton(action: { self.userSelection = "Set" }) { Text("Settings") }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
