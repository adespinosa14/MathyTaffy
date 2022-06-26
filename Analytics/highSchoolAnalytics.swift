//
//  highSchoolAnalytics.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/7/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import Foundation

class highincorrectAnswers{
    
    var highIncorrect = 0
    
    class var sharedInstance: highincorrectAnswers{
        struct singleton{
         static let instance = highincorrectAnswers()
        }
        return singleton.instance
    }
    
    init(){
        
        switch UserDefaults.standard.object(forKey: "highIncorrectQuestions") == nil {
        case true:
            highIncorrect = 0
            print("There are no incorrect answers in High School")
        default:
            highIncorrect = UserDefaults.standard.object(forKey: "highIncorrectQuestions") as! Int
        }
        
    }
    
}

class highCorrectAnswers{
    
    var highCorrect = 0
    
    class var sharedInstance: highCorrectAnswers{
        struct singleton{
            static let instance = highCorrectAnswers()
        }
        return singleton.instance
    }
    
    init(){
        
        switch UserDefaults.standard.object(forKey: "highCorrectQuestions") == nil{
        case true:
            highCorrect = 0
            print("There are no correct answers in High School")
        default:
            highCorrect = UserDefaults.standard.object(forKey: "highCorrectQuestions") as! Int
        }
        
    }
    
}

class highSchoolTotalQuestions{
    
    var highQuestionsTotal = 0
    
    class var sharedInstance: highSchoolTotalQuestions{
        struct singleton{
            static let instance = highSchoolTotalQuestions()
            
        }
        
        return singleton.instance
    }
    
    
    init() {
        
        switch UserDefaults.standard.object(forKey: "highTotalQuestions") == nil {
        case true:
            
            highQuestionsTotal = 0
            print("There are no answers in High School")
            
        default:
            highQuestionsTotal = UserDefaults.standard.object(forKey: "highTotalQuestions") as! Int
        }
        
    }
}
