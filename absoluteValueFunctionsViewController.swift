//
//  absoluteValueFunctionsViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 7/2/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class absoluteValueFunctionsViewController: UIViewController {
    
    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var userInputTwo: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var c = Int()
    var z = Int()
    var i = Int()
    var answerOne = Int()
    var answerTwo = Int()
    var gameDeterminate = Int()
    
    //MARK: Game Start
    
    func gameStart(){
        
        x = Int(arc4random_uniform(10) + 1)
        y = Int(arc4random_uniform(10) + 1)
        c = Int(arc4random_uniform(10) + 1)
        z = Int(arc4random_uniform(10) + 1)
        i = Int(arc4random_uniform(10) + 1)
        gameDeterminate = Int(arc4random_uniform(1) + 3)
        
        switch gameDeterminate{
            
        case 1:
            print("Case 1")
            
            hint.text = String("|x + \(y)| = \(c) + \(z)")
            answerOne = Int((c + z) - y)
            answerTwo = Int((c + z) * -1 - y)
            print(answerOne)
            print(answerTwo)
            
        case 2:
            print("Case 2")
            
            hint.text = String("|x - \(y)| = \(c) - \(z)")
            answerOne = Int((c - z) + y)
            answerTwo = Int((c - z) * -1 + y)
            print(answerOne)
            print(answerTwo)
            
        case 3:
            print("Case 3")
            
            hint.text = String("|x + \(y)| = \(c) - \(z)")
            answerOne = Int((c - z) - y)
            answerTwo = Int((c - z) * -1 - y)
            print(answerOne)
            print(answerTwo)
            
        case 4:
            print("Case 4")
            
            hint.text = String("|x - \(y)| = \(c) + \(z)")
            answerOne = Int((c + z) + y)
            answerOne = Int((c + z) * -1 + y)
            print(answerOne)
            print(answerTwo)
        default:
            print("This Code Should Never Run")
            
        }
            
            
        
    }
    
    //MARK: Submit Answers
    
    @IBAction func submitAnswer(_ sender: Any) {
        
        if(userInput.text == String(answerOne) && userInputTwo.text == String(answerTwo)){
            
            answerDisplay.text = "Correct"
            gameStart()
            answerDisplay.isHidden = false
            userInput.text = nil
            userInputTwo.text = nil
            questionsGottenRight.SharedInstance.questionsGotten += 1
            highCorrectAnswers.sharedInstance.highCorrect += 1
            
        }else if(userInput.text == String(answerTwo) && userInputTwo.text == String(answerOne)){
            
            answerDisplay.text = "Correct"
            gameStart()
            answerDisplay.isHidden = false
            userInput.text = nil
            userInputTwo.text = nil
            questionsGottenRight.SharedInstance.questionsGotten += 1
            highCorrectAnswers.sharedInstance.highCorrect += 1
            
        }else if(userInput.text != String(answerOne) && userInputTwo.text == String(answerTwo)){
            
            answerDisplay.text = "Close! Check Your First Answer"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }else if(userInput.text == String(answerOne) && userInput.text != String(answerTwo)){
            
            answerDisplay.text = "Close! Check Your Second Answer"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }else if(userInput.text != String(answerTwo) && userInputTwo.text == String(answerOne)){
            
            answerDisplay.text  = "Close! Check Your First Answer"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }else if(userInput.text == String(answerTwo) && userInputTwo.text != String(answerOne)){
            
            answerDisplay.text = "Close! Check Your Second Answer"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }else{
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }
        
        totalQuestions.sharedInstance.questionsAnswered += 1
        highSchoolTotalQuestions.sharedInstance.highQuestionsTotal += 1
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameStart()
        answerDisplay.isHidden = true
        
    }

}
