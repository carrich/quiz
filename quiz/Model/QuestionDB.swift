//
//  QuestionDB.swift
//  quiz
//
//  Created by Ngoduc on 5/15/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import Foundation
class QuestionDB{
    var list = [Question]()
    func listQuest() -> [Question]{
        var list1 = [Question]()
        for i in 1..<11 {
            if i % 2 != 0 {
                list1.append(Question(QuestionImage: String(i), correctAnswer: 0))
            } else {
                
                list1.append(Question(QuestionImage: String(i), correctAnswer: 1))
            }
        }
        return list1
    }
    init() {
        for i in 1..<11 {
            if i % 2 != 0 {
                list.append(Question(QuestionImage: String(i), correctAnswer: 0))
            } else {
                
                list.append(Question(QuestionImage: String(i), correctAnswer: 1))
            }
        }
        
    }
}
