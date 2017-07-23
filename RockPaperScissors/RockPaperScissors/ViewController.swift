//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by jon on 7/22/17.
//  Copyright © 2017 jon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func computerChoice() -> String {
        let choices: Array = ["rock", "paper", "scissors"]
        return choices[Int(arc4random_uniform(UInt32(choices.count)))]
    }
    
    func resultOfGame(winner: String, result: String) {
        print("WINNER: \(winner)")
        print("RESULT: \(result)")
        
        let controller: GameResultsController
        controller = storyboard?.instantiateViewController(withIdentifier: "GameResultsController") as! GameResultsController
        
        controller.winner = winner
        controller.result = result
        
        present(controller, animated: true, completion: nil)
    }

    @IBAction func userChoice(sender: UIButton) {
        let computerChoice = self.computerChoice()
        
        print("computer choice: \(computerChoice)")
        print("user choice: \(sender.currentTitle!)")
        
        if sender.currentTitle! == computerChoice {
            self.resultOfGame(winner: "tie", result: "itsATie")
        } else {
            switch sender.currentTitle! {
                case "rock":
                    if computerChoice == "paper" {
                        self.resultOfGame(winner: "computer", result: "PaperCoversRock")
                    } else {
                        self.resultOfGame(winner: "user", result: "RockCrushesScissors")
                    }
                case "scissors":
                    if computerChoice == "rock" {
                        self.resultOfGame(winner: "computer", result: "RockCrushesScissors")
                    } else {
                        self.resultOfGame(winner: "user", result: "ScissorsCutPaper")
                    }
                case "paper":
                    if computerChoice == "scissors" {
                        self.resultOfGame(winner: "computer", result: "ScissorsCutPaper")
                    } else {
                        self.resultOfGame(winner: "user", result: "PaperCoversRock")
                    }
                default: break
            }
        }
    }

}

