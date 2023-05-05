//
//  GameState.swift
//  RockPaperScissors
//
//  Created by Whoami on 04.05.2023.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    func showMessage(on state: GameState) -> String {
        var message: String {
            switch self {
            case .start:
                return "Rock, Paper, Scissors?"
            case .win:
                return "You Won!"
            case .lose:
                return "You lose!"
            case .draw:
                return "Its a draw"
            }
        }
        return message
    }
    
}
