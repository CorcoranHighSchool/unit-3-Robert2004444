//
//  Question.swift
//  Personality Quiz 1
//
//  Created by Robert Campos on 5/3/23.
//

import Foundation

//The Question structure
struct Question {
    var text : String
    var type : ResponseType
    var answers:[Answer]
}
//The type of response
enum ResponseType{
    case single, multiple, ranged
}
//Answer Data
struct Answer{
    var text : String
    var type : AnimalType
}
enum AnimalType: Character{
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition : String{
        switch self{
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends"
        case .cat:
            return "Mischievious, yet mild-tempered, you enjoy doing things or your terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return " You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}

