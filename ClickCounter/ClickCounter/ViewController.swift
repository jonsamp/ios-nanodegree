//
//  ViewController.swift
//  ClickCounter
//
//  Created by jon on 7/9/17.
//  Copyright © 2017 jon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func experiment() {
        let controller = UIAlertController()
        controller.title = "Test Alert"
        controller.message = "This is a test"
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default) {
            action in self.dismiss(animated: true, completion: nil)
        }
        
        let nopeAction = UIAlertAction(title: "nope", style: UIAlertActionStyle.default) {
            action in self.dismiss(animated: true, completion: nil)
        }
        
        controller.addAction(okAction)
        controller.addAction(nopeAction)
        self.present(controller, animated: true, completion: nil)
    }


}

