//
//  expressionsIntegratedOneViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/25/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit
    
class expressionsIntegratedOneViewController: UIViewController {
    
    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var z = Int()
    var n = Int()
    var c = Int()
    var i = Int()
    var test = -3*(2 + 3)
    var answer = Int()
    var finalAnswer = Int()
    var gameDeterminate = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(49) + 1)
        y = Int(arc4random_uniform(49) + 1)
        z = Int(arc4random_uniform(49) + 1)
        n = Int(arc4random_uniform(49) + 1)
        c = Int(arc4random_uniform(49) + 1)
        i = Int(arc4random_uniform(49) + 1)
        gameDeterminate = Int(arc4random_uniform(5) + 1)
        
        switch gameDeterminate{
            
        case 1:
            
            print("First Section")
            
            hint.text = String("\(x)(\(y) + \(z)) + \(n) - \(c)")
            answer = x*(y + z) + n
            break
        case 2:
            
            hint.text = String("\(x) + \(y)(\(z) + \(n)) - \(c)")
            answer = x + y*(z + n) - c
            break
        case 3:
            
            hint.text = String("\(x) + \(y)(\(z) + \(n)) x \(c) - \(i)")
            answer = y*(z + n) * c + x - i
            break
        case 4:
            
            hint.text = String("\(x) + \(y)(\(z) - \(n)) x \(c)")
            answer = y*(z - n) * c + x
            break
        case 5:
            
            hint.text = String("\(x) - \(y)(\(z) + \(n)) + \(c)")
            answer = -y*(z + n) + x + c
            
            
        default:
            
            print("This Code Should Never Run")
        }
        
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == String(answer) {
        case true:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            userInput.text = nil
            gameStart()
            highCorrectAnswers.sharedInstance.highCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            
        default:
            
            answerDisplay.text = "Incorrect"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
        }
        highSchoolTotalQuestions.sharedInstance.highQuestionsTotal += 1
        totalQuestions.sharedInstance.questionsAnswered += 1
        print(answer)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStart()
        print(answer)
        print(test)
    }

}
