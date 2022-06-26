//
//  middleSchoolAnalytics.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/7/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import Foundation

class middleIncorrectAnswers{
    
    var midIncorrectAnswers = 0
    
    class var sharedInstance: middleIncorrectAnswers{
        struct singleton{
            static let instance = middleIncorrectAnswers()
        }
        return singleton.instance
    }
    
    init(){
        
        switch UserDefaults.standard.object(forKey: "midIncorrectAnswers") == nil {
        case true:
            
            midIncorrectAnswers = 0
            print("There are no incorrect Answers in middle school")
            
        default:
            
            midIncorrectAnswers = UserDefaults.standard.object(forKey: "midIncorrectAnswers") as! Int
            
        }
        
    }
    
}

class middleCorrectQuestions{
    
    var midCorrectAnswer = 0
    
    class var sharedInstance: middleCorrectQuestions{
        struct singleton{
         static let instance = middleCorrectQuestions()
            
        }
        return singleton.instance
    }
    
    init(){
        
        switch UserDefaults.standard.object(forKey: "midCorrectAnswers") == nil{
        case true:
            midCorrectAnswer = 0
            print("There are no correct Answers in Middle School")
        default:
            midCorrectAnswer = UserDefaults.standard.object(forKey: "midCorrectAnswers") as! Int
        }
        
    }
    
}

class middleTotalQuestions{
    
    var midTotalQuestions = 0
    
    class var sharedInstance: middleTotalQuestions{
        struct singleton{
            
            static let instance = middleTotalQuestions()
            
        }
        return singleton.instance
    }
    
    init() {
        
        switch UserDefaults.standard.object(forKey: "midTotalQuestions") == nil {
        case true:
            
            midTotalQuestions = 0
            print("There are no questions answered in Middle School")
            
        default:
            
            midTotalQuestions = UserDefaults.standard.object(forKey: "midTotalQuestions") as! Int
            
        }
        
    }
    
}
