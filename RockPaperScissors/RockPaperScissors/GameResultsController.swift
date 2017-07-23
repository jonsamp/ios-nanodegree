//
//  GameResultsController.swift
//  RockPaperScissors
//
//  Created by jon on 7/22/17.
//  Copyright © 2017 jon. All rights reserved.
//

import UIKit

class GameResultsController: UIViewController {
    
    var winner: String?
    var result: String?
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        resultImage.image = UIImage(named: self.result!)
        winnerLabel.text = "Winner: \(String(describing: self.winner!))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
