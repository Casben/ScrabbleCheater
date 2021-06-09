//
//  Scrabble.swift
//  ScrabbleCheater
//
//  Created by Herbert Dodge on 6/8/21.
//

import Foundation

class Scrabble {
    let bag = ["A":9, "B":2, "C":2, "D":4, "E":12, "F":2, "G":3, "H":2, "I":9, "J":1, "K":1, "L":4, "M":2, "N":6, "O":8, "P":2, "Q":1, "R":6, "S":4, "T":6, "U":4, "V":2, "W":2, "X":1, "Y":2, "Z":1]
    
    var randomLetters = Array<String>()
    var dictionary = [String]()
    
     func fetchRandomLetters() {
        var tempBag = bag
        let possibleLetters = bag.keys
        
        var randomLetter = String(possibleLetters.randomElement()!)
        
        while randomLetters.count <= 6 {
            if tempBag[randomLetter] == 0 {
                tempBag[randomLetter] = nil
            }
            
            if let number = tempBag[randomLetter] {
                tempBag[randomLetter] = number - 1
                randomLetters.append(randomLetter)
            }
            
            randomLetter = String(possibleLetters.randomElement()!)
            
        }
        print(randomLetters)
    }
    
     func resetLetters() {
        randomLetters.removeAll()
    }
    
     func fetchWordList() {
        NetworkManager.shared.fetchWordList { [unowned self] words in
            self.dictionary = Array(words)
        }
    }
}
