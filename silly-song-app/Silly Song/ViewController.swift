//
//  ViewController.swift
//  Silly Song
//
//  Created by Jon Samp on 6/17/17.
//  Copyright © 2017 jonsamp. All rights reserved.
//

import UIKit

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
         lyricsView.text = lyricsFromName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }
    
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameFromName(name: String) -> String {
    var lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    var resultingCharacters = [Character]()
    var foundVowelYet = false
    
    // Iterate through all the characters in the name
    for (_, char) in lowercaseName.characters.enumerated() {
        
        // If the character is a vowel, add it to the result
        // To add consonants after the first vowel, set a boolean that a vowel has been found. Once set, all letters get added
        if String(char).rangeOfCharacter(from: vowelSet) != nil || foundVowelYet {
            foundVowelYet = true
            resultingCharacters.append(char)
        }
    }
    
    return String(resultingCharacters)
}

func lyricsFromName (lyricsTemplate: String, fullName: String) -> String {
    
    // Populate the lyrics with the user's name
    return lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName.capitalized)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(name: fullName))
}

