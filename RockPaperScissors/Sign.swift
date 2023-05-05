//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Whoami on 04.05.2023.
//

import Foundation


enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊🏻"
        case .paper:
            return "✋🏻"
        case .scissors:
            return "✌️"
        }
    }
    
    
    func compareChooses(take another: Sign) -> GameState {
        var gameState = GameState.start
        if self == another {
            gameState = .draw
        }
        else if self == .rock && another == .paper {
            gameState = .lose
        }
        else if self == .paper && another == .scissors {
            gameState = .lose
        }
        else if self == .scissors && another == .rock {
            gameState = .lose
        }
        else {
            gameState = .win
        }
        return gameState
    }
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}
