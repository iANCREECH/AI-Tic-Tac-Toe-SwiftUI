//
//  GameBuild.swift
//  T3 (Tic-Tac-Toe)
//
//  Copyright © 2020 Ian Creech. All rights reserved.
//

import Foundation
import SwiftUI


// Enumeration for game state
enum GameState {
    case empty
    case player1
    case player2
    case ai
}

class Players: ObservableObject {
    @Published var player1 = "Player"
    @Published var player2 = "Player"
}
