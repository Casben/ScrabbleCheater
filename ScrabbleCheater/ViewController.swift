//
//  ViewController.swift
//  ScrabbleCheater
//
//  Created by Herbert Dodge on 6/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    var scrabble = Scrabble()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        scrabble.fetchWordList()
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        scrabble.resetLetters()
        scrabble.fetchRandomLetters()
        
    }
    
}

