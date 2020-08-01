//
//  SettingsView.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showSheet = false
    
    @State var difficulty = ["Easy", "Medium", "Hard"]
    
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color.offWhite.edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .background(RectangleCard(w: 250, h: 150, colorFill: .offWhite), alignment: .center)
                    .padding(.top, 200)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Enter Player names").font(.headline)
                            
                            HStack {
                                
                                Image(systemName: "person")
                                
                                TextField("Enter player 1's name", text: self.$userSettings.player1)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.offWhite)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                    .shadow(color: Color.white, radius: 15, x: -10, y: -10)
                            ).padding(.bottom)
                            
                            HStack {
                                
                                Image(systemName: "person")
                                
                                TextField("Enter player 2's name", text: self.$userSettings.player2)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                            }
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.offWhite)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                    .shadow(color: Color.white, radius: 15, x: -10, y: -10)
                            ).padding(.bottom)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Choose an AI difficulty")
                            .font(.headline)
                            
                            Picker("Difficulty", selection: self.$userSettings.difficulty) {
                                
                                ForEach(0 ..< difficulty.count) {
                                    Text("\(self.difficulty[$0])")
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                    }
                    .padding()
                    .padding(.top, 100)
                    .padding(.bottom, 450)
                }
                .padding()
                .background(Color.offWhite)
            }
        }
        .navigationBarItems(trailing:
            Button (action: { self.showSheet.toggle() }) { Image(systemName: "info.circle") }
                .sheet(isPresented: $showSheet) { SheetView() }
        )
    }
}


class UserSettings: ObservableObject {
    @Published var player1 = "Player 1"
    @Published var player2 = "Player 2"
    @Published var difficulty = 1
}


struct SheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    Image("X").resizable().frame(width: 75, height: 75, alignment: .center)
                    Image("O").resizable().frame(width: 75, height: 75, alignment: .center)
                    Image("X").resizable().frame(width: 75, height: 75, alignment: .center)
                }
                
                Spacer()
                
                VStack {
                    
                    Text("What is this for?")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Here you can customize the names of each player & the difficulty of the single player mode. Your names are not saved or sent anywhere.")
                        .foregroundColor(.black)
                        .font(Font.system(size: 25))
                        .fontWeight(.light)
                        .lineSpacing(10)
                        .lineLimit(10)
                        .multilineTextAlignment(.center)
                        .padding(.all, 20)
                }
                .padding(.bottom, 175)
            }
            .navigationBarItems(leading:
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                }
            )
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
