//
//  exponentRulesEigthViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 7/5/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class exponentRulesEigthViewController: UIViewController {
    
    
    @IBOutlet var hint: UILabel!
    @IBOutlet var answerDisplay: UILabel!
    @IBOutlet var userInput: UITextField!
    
    var x = Int()
    var base =  Int()
    var baseTwo = Int()
    var exponent = ["0","²", "³","⁴", "⁵", "⁶", "⁷", "⁸", "⁹", "¹⁰", "¹¹", "¹²", "¹³", "¹⁴", "¹⁵", "¹⁶"]
    var gameDeterminate = Int()
    var exponentRandom = Int()
    var exponentRandomTwo = Int()
    var answer = String()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(4) + 1)
        base = Int(arc4random_uniform(4) + 1)
        baseTwo = Int(arc4random_uniform(4) + 1)
        exponentRandom = Int(arc4random_uniform(3) + 10)
        exponentRandomTwo = Int(arc4random_uniform(3) + 5)
        gameDeterminate = Int(arc4random_uniform(2) + 1)
        
        switch gameDeterminate{
            
        case 1:
            print("Case 1")
            
            hint.text = String("\(base)\(exponent[exponentRandom]) x \(base)\(exponent[exponentRandomTwo])")
            answer = String("\(base)\(exponent[exponentRandom + exponentRandomTwo])")
            print(answer)
            
        case 2:
            
            hint.text = String("\(base)\(exponent[exponentRandom]) ÷ \(base)\(exponent[exponentRandomTwo])")
            answer = String("\(base)\(exponent[exponentRandom - exponentRandomTwo])")
            print(answer)
            
        default:
            print("This Code  Should Not Run")
            
        }
        
    }
    
    
    @IBAction func exponentButtonPressed(_ sender: Any) {
        
        switch userInput.text == nil{
            
        case true:
            userInput.text = String("\(userInput.text!)" + "Hello")
        default:
            userInput.text = String("\(userInput.text!)" + "Hello")
        }
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == String(answer){
            
        case true:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            userInput.text = nil
            middleCorrectQuestions.sharedInstance.midCorrectAnswer += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            
        default:
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            middleIncorrectAnswers.sharedInstance.midIncorrectAnswers += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }
        
        totalQuestions.sharedInstance.questionsAnswered += 1
        middleTotalQuestions.sharedInstance.midTotalQuestions += 1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStart()
        answerDisplay.isHidden = true
        print(answer)
        
    }
    
}
