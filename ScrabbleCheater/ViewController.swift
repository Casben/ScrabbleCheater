//
//  ViewController.swift
//  ScrabbleCheater
//
//  Created by Herbert Dodge on 6/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    var scrabble = Scrabble()
    
    var answers = [String: Int]() {
        didSet {
            for answer in answers {
                answersLabel.text! += answer.key + " = \(answer.value)" + "\n"
            }
        }
    }

    @IBOutlet weak var selectedLettersLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var cheatButton: UIButton!
    
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
        answersLabel.text = ""
        cheatButton.isEnabled = true
    }
    
    @IBAction func cheatButtonTapped(_ sender: UIButton) {
        scrabble.matchWords { [unowned self] answers in
            self.answers = answers
        }
        cheatButton.isEnabled = false
    }
    
}

