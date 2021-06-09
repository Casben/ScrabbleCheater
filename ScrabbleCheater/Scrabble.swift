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
    var dictionary = Set<String>()
    var possibleWords = [String: Int]()
    
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
    
     func resetGame() {
        randomLetters.removeAll()
        possibleWords.removeAll()
    }
    
     func fetchWordList() {
        NetworkManager.shared.fetchWordList { [unowned self] words in
            self.dictionary = words
            print(dictionary)
            
        }
    }
    
    func matchWords() {
        var dictionaryWord = ""
        var selectedLetters = randomLetters.joined().lowercased()
       
        for word in dictionary {
            for letter in word {
                if selectedLetters.contains(letter.lowercased()) {
                    dictionaryWord += String(letter)
                    selectedLetters.remove(at: selectedLetters.firstIndex(of: letter)!)
                    print(dictionaryWord)
                }
            }
            
            if dictionaryWord == word {
                let totalPoints = calculatePoints(forWord: word)
                possibleWords[word] = totalPoints
                print(totalPoints)
            }
            dictionaryWord = ""
            selectedLetters = randomLetters.joined().lowercased()
        }
        
        print("possible words are:")
        print(possibleWords)
    }
    
    func calculatePoints(forWord word: String) -> Int {
        var points = 0
        for letter in word {
            switch letter {
            case "e", "a", "i", "o", "n", "r", "t", "l", "s", "u":
                points += 1
            case "d", "g":
                points += 2
            case "b", "c", "m", "p":
                points += 3
            case "f", "h", "v", "w", "y":
                points += 4
            case "k":
                points += 5
            case "j", "x":
                points += 8
            case "q", "z":
                points += 10
            default:
                points += 0
            }
        }
        
        return points
    }
}
