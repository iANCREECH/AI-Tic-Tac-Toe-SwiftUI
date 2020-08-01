//
//  TwoPlayerView.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import SwiftUI

struct TwoPlayerView: View {
    
    // Game board array for each button
    @State private var board: [GameState] = [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]
    
    @State private var turn: Bool = true // true = player 1's turn, false = player 2's turn
    
    @State private var resultTitle = ""
    @State private var resultMessage = ""
    @State private var showingAlert = false
    
    @EnvironmentObject var userSettings: UserSettings
    
    // MARK: Start of body
    var body: some View {
        ZStack {
            
            Color.offWhite.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack(alignment: .leading) {
                    
                    Text("Two Player")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    
                    Text("\(userSettings.player1) VS \(userSettings.player2)")
                        .font(.subheadline)
                        .fontWeight(.thin)
                        .foregroundColor(Color.black)
                }
                .background(RectangleCard(w: 250, h: 150, colorFill: .offWhite), alignment: .center)
                .padding(.top, 110)
                
                //Spacer().frame(width: 5).background(Color.blue)
                
                VStack {
                    
                    Text(self.turn ? "\(userSettings.player1)'s Turn" : "\(userSettings.player2)'s Turn")
                        .font(.callout)
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .background(RectangleCard(w: 150, h: 30, colorFill: .offWhite))
                        .padding(.bottom)
                    
                    
                    HStack {
                        
                        GameButton(action: {
                            self.applyTurn(index: 0)
                            self.result()
                        }) { Text((board[0] != .empty) ? (board[0] == .player1) ? "X" : "O" : " ") }
                        
                        GameButton(action: {
                            self.applyTurn(index: 1)
                            self.result()
                        }) { Text((board[1] != .empty) ? (board[1] == .player1) ? "X" : "O" : " ") }
                        
                        GameButton(action: {
                            self.applyTurn(index: 2)
                            self.result()
                        }) { Text((board[2] != .empty) ? (board[2] == .player1) ? "X" : "O" : " ") }
                    }
                    
                    HStack {
                        
                        GameButton(action: {
                            self.applyTurn(index: 3)
                            self.result()
                        }) { Text((board[3] != .empty) ? (board[3] == .player1) ? "X" : "O" : " ") }
                        
                        GameButton(action: {
                            self.applyTurn(index: 4)
                            self.result()
                        }) { Text((board[4] != .empty) ? (board[4] == .player1) ? "X" : "O" : " ") }
                        
                        GameButton(action: {
                            self.applyTurn(index: 5)
                            self.result()
                        }) { Text((board[5] != .empty) ? (board[5] == .player1) ? "X" : "O" : " ") }
                    }
                    
                    HStack {
                        
                        GameButton(action: {
                            self.applyTurn(index: 6)
                            self.result()
                        }) { Text((board[6] != .empty) ? (board[6] == .player1) ? "X" : "O" : " ") }
                        
                        GameButton(action: {
                            self.applyTurn(index: 7)
                            self.result()
                        }) { Text((board[7] != .empty) ? (board[7] == .player1) ? "X" : "O" : " ") }
                        
                        GameButton(action: {
                            self.applyTurn(index: 8)
                            self.result()
                        }) { Text((board[8] != .empty) ? (board[8] == .player1) ? "X" : "O" : " ") }
                    }
                }
                .background(RectangleCard(w: 300, h: 300, colorFill: .offWhite), alignment: .center)
                .padding(.top, 190)
                .padding(.bottom, 200)
                
                //Spacer().frame(width: 5).background(Color.yellow)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(resultTitle), message: Text(resultMessage), dismissButton: .destructive(Text("Reset Game")) { self.resetGame() })
            }
        }
    }
    
    // MARK: Functions
    
    // Apply turn to selected button
    func applyTurn(index: Int) {
        if board[index] == .empty { // prevents player from changing location that is already used
            if turn == true { // player 1's turn is applied
                board[index] = .player1
            } else if turn == false { // player 2's turn is applied
                board[index] = .player2
            }
            turn.toggle() // toggles boolean value for turn
        }
    }
    
    func fullCheck() -> Bool {
        // Checks each array location for value
        if board[0] != .empty && board[1] != .empty && board[2] != .empty &&
            board[3] != .empty && board[4] != .empty && board[5] != .empty &&
            board[6] != .empty && board[7] != .empty && board[8] != .empty {
            return true // is full
        }
        return false // assume not full
    }
    
    // Check for winning combinations
    func winCheck() -> Int {
        // Checks for all possible winning combinations for player 1
        if ((board[0] == .player1 && board[1] == .player1 && board[2] == .player1) ||
            (board[3] == .player1 && board[4] == .player1 && board[5] == .player1) ||
            (board[6] == .player1 && board[7] == .player1 && board[8] == .player1) ||
            (board[0] == .player1 && board[3] == .player1 && board[6] == .player1) ||
            (board[1] == .player1 && board[4] == .player1 && board[7] == .player1) ||
            (board[2] == .player1 && board[5] == .player1 && board[8] == .player1) ||
            (board[0] == .player1 && board[4] == .player1 && board[8] == .player1) ||
            (board[6] == .player1 && board[4] == .player1 && board[2] == .player1)
            ) {
            return 1
            // Checks for all possible winning combinations for player 2
        } else if ((board[0] == .player2 && board[1] == .player2 && board[2] == .player2) ||
            (board[3] == .player2 && board[4] == .player2 && board[5] == .player2) ||
            (board[6] == .player2 && board[7] == .player2 && board[8] == .player2) ||
            (board[0] == .player2 && board[3] == .player2 && board[6] == .player2) ||
            (board[1] == .player2 && board[4] == .player2 && board[7] == .player2) ||
            (board[2] == .player2 && board[5] == .player2 && board[8] == .player2) ||
            (board[0] == .player2 && board[4] == .player2 && board[8] == .player2) ||
            (board[6] == .player2 && board[4] == .player2 && board[2] == .player2)
            ) {
            return 2
        }
        return 0 // assume no winner
    }
    
    // Set values in game board array back to 0 (empty)
    func resetGame() {
        for index in 0 ..< board.count {
            board[index] = .empty
        }
        turn = true // set turn back to first player
    }
    
    // Formats alert
    func gameAlert(title: String, message: String) {
        resultTitle = title
        resultMessage = message
        showingAlert = true
    }
    
    // Applys alert formatting
    func result() {
        let winner = winCheck()
        let tie = fullCheck()
        
        if winner == 1 {
            gameAlert(title: "Winner!", message: "\(userSettings.player1) wins!")
        } else if winner == 2 {
            gameAlert(title: "Winner!", message: "\(userSettings.player2) wins!")
        } else if tie {
            gameAlert(title: "Tie!", message: "There is no winner!")
        }
    }
}

struct TwoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TwoPlayerView()
    }
}
