//
//  NetworkManager.swift
//  ScrabbleCheater
//
//  Created by Herbert Dodge on 6/9/21.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    
    func fetchWordList(completion: @escaping (Set<String>) -> Void) {
        
        if let url = URL(string:"https://s3.amazonaws.com/thinkific/file_uploads/88925/attachments/fcd/686/a82/dictionary.txt") {
            var dictionary = Set<String>()
            
            let contents = try! String(contentsOf: url)
            let lines = contents.split(whereSeparator: \.isNewline)
            
            for line in lines {
                if line.count <= 7 {
                    dictionary.insert(String(line))
                }
            }
            print(dictionary.count)
            completion(dictionary)
        }
    }
}
