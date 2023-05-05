//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Whoami on 04.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(based: .start)
       }

    @IBAction func chooseRock(_ sender: Any) {
        play(takes: .rock)
    }
    @IBAction func choosePaper(_ sender: Any) {
        play(takes: .paper)
    }
    @IBAction func chooseScissors(_ sender: Any) {
        play(takes: .scissors)
    }
    @IBAction func playAgain(_ sender: Any) {
        updateUI(based: .start)
    }
    
    func updateUI(based on: GameState) {
        if on == .start {
            gameStatus.text = GameState.start.showMessage(on: .start)
            view.backgroundColor = .darkGray
            appSign.text = "🤖"
            playAgainButton.isHidden = true
            enableButtons(status: true)
            paperButton.isHidden = false
            rockButton.isHidden = false
            scissorsButton.isHidden = false
        }
        if on == .draw {
            gameStatus.text = GameState.draw.showMessage(on: .draw)
            view.backgroundColor = .gray
            }
        if on == .lose {
            gameStatus.text = GameState.lose.showMessage(on: .lose)
            view.backgroundColor = .red
        }
        if on == .win{
            gameStatus.text = GameState.win.showMessage(on: .win)
            view.backgroundColor = .green
        }
    }
    
    func enableButtons(status: Bool) {
        rockButton.isEnabled = status
        paperButton.isEnabled = status
        scissorsButton.isEnabled = status
    }
    func play(takes: Sign) {
        
        let computerChoice = randomSign()
        if takes == .rock {
            enableButtons(status: false)
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            let result = Sign.rock.compareChooses(take: computerChoice)
            appSign.text = computerChoice.emoji
            updateUI(based: result)
            playAgainButton.isHidden = false
        }
        else if takes == .paper {
            enableButtons(status: false)
            rockButton.isHidden = true
            scissorsButton.isHidden = true
            let result = Sign.paper.compareChooses(take: computerChoice)
            appSign.text = computerChoice.emoji
            updateUI(based: result)
            playAgainButton.isHidden = false
        } else {
            enableButtons(status: false)
            rockButton.isHidden = true
            paperButton.isHidden = true
            let result = Sign.scissors.compareChooses(take: computerChoice)
            appSign.text = computerChoice.emoji
            updateUI(based: result)
            playAgainButton.isHidden = false
        }
    }
}

