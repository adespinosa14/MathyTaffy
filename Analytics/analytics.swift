//
//  File.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/3/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import Foundation

class questionsWrong{
    
    var questionsIncorrect = 0
    
    class var sharedInstances: questionsWrong{
        struct Singleton{
            static let instance = questionsWrong()
        }
        return Singleton.instance
    }
    
    init() {
        
        switch UserDefaults.standard.object(forKey: "answersWrong") == nil{
        case true:
            
            print("There are no incorrect answers")
             questionsIncorrect = 0
            
        default:
            
            questionsIncorrect = UserDefaults.standard.object(forKey: "answersWrong") as! Int
        }
    }
    
}


class questionsGottenRight{
    
    var questionsGotten = 0
    
    class var SharedInstance: questionsGottenRight{
        struct Singleton{
            static let instance = questionsGottenRight()
        }
        
        return Singleton.instance
    }
    
    init(){
        
        switch UserDefaults.standard.object(forKey: "questionsRight") == nil {
        case true:
            print("There are no right answeres")
            questionsGotten = 0
        default:
            
            questionsGotten = UserDefaults.standard.object(forKey: "questionsRight") as! Int
            
        }
        
    }
    
}

class totalQuestions{
   
    var questionsAnswered = 0
    
    class var sharedInstance: totalQuestions{
        struct Singleton {
            static let instance = totalQuestions()
        }
        
        return Singleton.instance
    }
    
    init() {
        
        switch UserDefaults.standard.object(forKey: "totalQuestions") == nil {
        case true:
            
            print("Nil")
            questionsAnswered = 0
            
        default:
            questionsAnswered = UserDefaults.standard.object(forKey: "totalQuestions") as! Int
        }
        
    }
}

