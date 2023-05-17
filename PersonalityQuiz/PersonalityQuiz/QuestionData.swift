//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Robert Campos on 4/26/23.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}
enum ResponseType {
    case single, multiple, ranged
}
struct Answer {
    var text: String
    var type: AnimalType
}
enum AnimalType: Character {
    case dog = "🐶", cat = "😺", rabbit = "🐇", turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surrounded yourself with the people you love and enjoy activites with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise behond your years, and you foucs on the details. Slow and steady wins the race."
        }
    }
}
