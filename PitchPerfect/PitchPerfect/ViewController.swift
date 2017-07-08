//
//  ViewController.swift
//  PitchPerfect
//
//  Created by jon on 7/8/17.
//  Copyright © 2017 jon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var startRecordingButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordingButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startRecordingAudio(_ sender: Any) {
        recordingLabel.text = "Recording..."
        stopRecordingButton.isEnabled = true
        startRecordingButton.isEnabled = false
    }

    @IBAction func stopRecordingAudio(_ sender: Any) {
        recordingLabel.text = "Tap to record"
        stopRecordingButton.isEnabled = false
        startRecordingButton.isEnabled = true
    }
}

