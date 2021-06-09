//
//  ViewController.swift
//  ScrabbleCheater
//
//  Created by Herbert Dodge on 6/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    var scrabble = Scrabble()

    @IBOutlet weak var selectedLettersLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        scrabble.fetchRandomLetters()
        scrabble.fetchWordList()
        updateSelectedLettersLabel()
        
    }
    
    func updateSelectedLettersLabel() {
        selectedLettersLabel.text = scrabble.randomLetters.joined()
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        scrabble.resetGame()
        scrabble.fetchRandomLetters()
        updateSelectedLettersLabel()
    }
    
    @IBAction func cheatButtonTapped(_ sender: UIButton) {
        scrabble.matchWords()
    }
    
}

