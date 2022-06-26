//
//  elementarySchoolAnalytics.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/4/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import Foundation

class elementarySchoolWrong{
    
    var eWrongAnswers = 0
    
    class var sharedInstance: elementarySchoolWrong{
        struct singleton{
            static let instance = elementarySchoolWrong()
        }
        
        return singleton.instance
    }
    
    init(){
    
        switch UserDefaults.standard.object(forKey: "eWrong") == nil{
        case true:
            eWrongAnswers = 0
            print("There are no wrong answers in Elementary School")
        default:
            eWrongAnswers = UserDefaults.standard.object(forKey: "eWrong") as! Int
        }
        
    }
    
}


class elementarySchoolCorrect{
    
    var eCorrect = 0
    
    class var sharedInstance: elementarySchoolCorrect{
        struct singleton{
         static let instance = elementarySchoolCorrect()
            
        }
        return singleton.instance
    }
    
    init(){
        
        switch UserDefaults.standard.object(forKey: "eCorrect") == nil {
        case true:
            
            print("There is no correct answers in Elementary School")
            eCorrect = 0
            
        default:
            eCorrect = UserDefaults.standard.object(forKey: "eCorrect") as! Int
        }
        
    }
    
}

class totalElementarySchoolAnalytics{
    
    var tElementaryQuestions = 0
    
    class var sharedInstance: totalElementarySchoolAnalytics{
        struct singleton {
            static let instance = totalElementarySchoolAnalytics()
        }
        
        return singleton.instance
        
    }
    
    init(){
        
        switch UserDefaults.standard.object(forKey: "tElementary") == nil {
        case true:
            
            tElementaryQuestions = 0
            print("No Elementary Total Questions")
            
        default:
            tElementaryQuestions = UserDefaults.standard.object(forKey: "tElementary") as! Int
        }
        
    }
    
}
