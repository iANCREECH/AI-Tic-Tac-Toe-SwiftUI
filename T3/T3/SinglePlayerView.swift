//
//  SinglePlayerView.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import SwiftUI

struct SinglePlayerView: View {
    
    // Game board array for each button
    @State var board: [GameState] = [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]
    
    @State var turn: Bool = true // true = player 1's turn, false = AI's turn
    
    // State variables for alert
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
                    
                    Text("Single Player")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    
                    Text("Player VS AI")
                        .font(.subheadline)
                        .fontWeight(.thin)
                        .foregroundColor(Color.black)
                }
                .background(RectangleCard(w: 250, h: 150, colorFill: .offWhite), alignment: .center)
                .padding(.top, 95)
                
                //Spacer().frame(width: 5).background(Color.blue)
                
                VStack {
                    
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
                
                //Spacer().frame(width: 5).background(Color.blue)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(resultTitle), message: Text(resultMessage), dismissButton: .destructive(Text("Reset Game")) { self.resetGame() })
            }
        }
    }
    
    // MARK: Functions
    
    // Apply turn to selected button
    func applyTurn(index: Int) {
        board[index] = .player1 // players move
        // Delay for "AI thinking" affect
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.aiMove() // ai's move
        }
    }
    
    // Checks for winning combination
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
        } else if ((board[0] == .ai && board[1] == .ai && board[2] == .ai) ||
            (board[3] == .ai && board[4] == .ai && board[5] == .ai) ||
            (board[6] == .ai && board[7] == .ai && board[8] == .ai) ||
            (board[0] == .ai && board[3] == .ai && board[6] == .ai) ||
            (board[1] == .ai && board[4] == .ai && board[7] == .ai) ||
            (board[2] == .ai && board[5] == .ai && board[8] == .ai) ||
            (board[0] == .ai && board[4] == .ai && board[8] == .ai) ||
            (board[6] == .ai && board[4] == .ai && board[2] == .ai)
            ) {
            return 2
        }
        return 0 // assume no winner
    }
    
    // Checks for full board
    func fullCheck() -> Bool {
        // Checks each array location for value
        if board[0] != .empty && board[1] != .empty && board[2] != .empty &&
            board[3] != .empty && board[4] != .empty && board[5] != .empty &&
            board[6] != .empty && board[7] != .empty && board[8] != .empty {
            return true // is full
        }
        return false // assume not full
    }
    
    // Generate random number for AI
    func randomNum() -> Int {
        return Int.random(in: 0...8) // generates random number 0-8 inclusive
    }
    
    // Apply AI
    func aiMove() {
        let difficulty = userSettings.difficulty
        
        if winCheck() == 0 && !fullCheck() {
            if difficulty == 0 {
                aiEasy()
            } else if difficulty == 1 {
                aiMed()
            } else if difficulty == 2 {
                aiHard()
            }
            result()
        }
    }
    
    // AI easy difficulty
    func aiEasy() {
        var randLocation = randomNum() // generate first random location
        
        while board[randLocation] != .empty {
            randLocation = randomNum() // generate random board location
        }
        board[randLocation] = .ai
    }
    
    // AI medium difficulty
    func aiMed() {
        // If the middle place is not taken
        if board[4] == .empty {
            board[4] = .ai
            // Top row
        } else if (board[0] == .player1 && board[1] == .player1) && board[2] == .empty {
            board[2] = .ai
        } else if (board[1] == .player1 && board[2] == .player1) && board[0] == .empty {
            board[0] = .ai
        } else if (board[0] == .player1 && board[2] == .player1) && board[1] == .empty {
            board[1] = .ai
            // Middle row
        } else if (board[3] == .player1 && board[4] == .player1) && board[5] == .empty {
            board[5] = .ai
        } else if (board[4] == .player1 && board[5] == .player1) && board[3] == .empty {
            board[3] = .ai
        } else if (board[3] == .player1 && board[5] == .player1) && board[4] == .empty {
            board[4] = .ai
            // Bottom row
        } else if (board[6] == .player1 && board[7] == .player1) && board[8] == .empty {
            board[8] = .ai
        } else if (board[7] == .player1 && board[8] == .player1) && board[6] == .empty {
            board[6] = .ai
        } else if (board[6] == .player1 && board[8] == .player1) && board[7] == .empty {
            board[7] = .ai
            // Left column
        } else if (board[0] == .player1 && board[3] == .player1) && board[6] == .empty {
            board[6] = .ai
        } else if (board[3] == .player1 && board[6] == .player1) && board[0] == .empty {
            board[0] = .ai
        } else if (board[0] == .player1 && board[6] == .player1) && board[3] == .empty {
            board[3] = .ai
            // Middle column
        } else if (board[1] == .player1 && board[4] == .player1) && board[7] == .empty {
            board[7] = .ai
        } else if (board[4] == .player1 && board[7] == .player1) && board[1] == .empty {
            board[1] = .ai
        } else if (board[1] == .player1 && board[7] == .player1) && board[4] == .empty {
            board[4] = .ai
            // Right column
        } else if (board[2] == .player1 && board[5] == .player1) && board[8] == .empty {
            board[8] = .ai
        } else if (board[5] == .player1 && board[8] == .player1) && board[2] == .empty {
            board[2] = .ai
        } else if (board[2] == .player1 && board[8] == .player1) && board[5] == .empty {
            board[5] = .ai
            // Top Left Diagonal
        } else if (board[0] == .player1 && board[4] == .player1) && board[8] == .empty {
            board[8] = .ai
        } else if (board[4] == .player1 && board[8] == .player1) && board[0] == .empty {
            board[0] = .ai
        } else if (board[0] == .player1 && board[8] == .player1) && board[4] == .empty {
            board[4] = .ai
            // Bottom Left Diagonal
        } else if (board[6] == .player1 && board[4] == .player1) && board[2] == .empty {
            board[2] = .ai
        } else if (board[4] == .player1 && board[2] == .player1) && board[6] == .empty {
            board[6] = .ai
        } else if (board[6] == .player1 && board[2] == .player1) && board[4] == .empty {
            board[4] = .ai
            // If nothing to block make a selection that is not already taken
        } else {
            aiEasy()
        }
    }
    
    // AI hard difficulty
    func aiHard() {
        if (board[0] == .ai && board[1] == .ai) && board[2] == .empty {
            board[2] = .ai
        } else if (board[1] == .ai && board[2] == .ai) && board[0] == .empty {
            board[0] = .ai
        } else if (board[0] == .ai && board[2] == .ai) && board[1] == .empty {
            board[1] = .ai
            // Middle row
        } else if (board[3] == .ai && board[4] == .ai) && board[5] == .empty {
            board[5] = .ai
        } else if (board[4] == .ai && board[5] == .ai) && board[3] == .empty {
            board[3] = .ai
        } else if (board[3] == .ai && board[5] == .ai) && board[4] == .empty {
            board[4] = .ai
            // Bottom row
        } else if (board[6] == .ai && board[7] == .ai) && board[8] == .empty {
            board[8] = .ai
        } else if (board[7] == .ai && board[8] == .ai) && board[6] == .empty {
            board[6] = .ai
        } else if (board[6] == .ai && board[8] == .ai) && board[7] == .empty {
            board[7] = .ai
            // Left column
        } else if (board[0] == .ai && board[3] == .ai) && board[6] == .empty {
            board[6] = .ai
        } else if (board[3] == .ai && board[6] == .ai) && board[0] == .empty {
            board[0] = .ai
        } else if (board[0] == .ai && board[6] == .ai) && board[3] == .empty {
            board[3] = .ai
            // Middle column
        } else if (board[1] == .ai && board[4] == .ai) && board[7] == .empty {
            board[7] = .ai
        } else if (board[4] == .ai && board[7] == .ai) && board[1] == .empty {
            board[1] = .ai
        } else if (board[1] == .ai && board[7] == .ai) && board[4] == .empty {
            board[4] = .ai
            // Right column
        } else if (board[2] == .ai && board[5] == .ai) && board[8] == .empty {
            board[8] = .ai
        } else if (board[5] == .ai && board[8] == .ai) && board[2] == .empty {
            board[2] = .ai
        } else if (board[2] == .ai && board[8] == .ai) && board[5] == .empty {
            board[5] = .ai
            // Top Left Diagonal
        } else if (board[0] == .ai && board[4] == .ai) && board[8] == .empty {
            board[8] = .ai
        } else if (board[4] == .ai && board[8] == .ai) && board[0] == .empty {
            board[0] = .ai
        } else if (board[0] == .ai && board[8] == .ai) && board[4] == .empty {
            board[4] = .ai
            // Bottom Left Diagonal
        } else if (board[6] == .ai && board[4] == .ai) && board[2] == .empty {
            board[2] = .ai
        } else if (board[4] == .ai && board[2] == .ai) && board[6] == .empty {
            board[6] = .ai
        } else if (board[6] == .ai && board[2] == .ai) && board[4] == .empty {
            board[4] = .ai
            // If nothing to block make a selection that is not already taken
        } else {
            aiMed()
        }
    }
    
    // Set values in game board array back to .empty
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
            gameAlert(title: "Winner!", message: "You win!")
        } else if winner == 2 {
            gameAlert(title: "Loser!", message: "The AI wins!")
        } else if tie {
            gameAlert(title: "Tie!", message: "There is no winner!")
        }
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView()
    }
}
