//
//  oneStepEquationsViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/22/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class oneStepEquationsViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var c = Int()
    var n = Int()
    var answer = Int()
    var gameDeterminate = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(8) + 2)
        y = Int(arc4random_uniform(8) + 2)
        n = Int(arc4random_uniform(9) + 1)
        c = Int(arc4random_uniform(9) + 1)
        gameDeterminate = Int(arc4random_uniform(4) + 1)
        
        switch gameDeterminate {
        case 1:
            
            n = x * y - c
            c = x * y - n
            
            hint.text = String("\(x) x \(y) = \(c) + x")
            answer = n
            break
            
        case 2:
            
            n = x * y - c
            c = x * y - n
            hint.text = String("\(x) x \(y) = x + \(n)")
            answer = c
            break
            
        case 3:
            
            n = x * y - c
            c = x * y - n
            hint.text = String("\(x) x X = \(c) + \(n)")
            answer = y
            break
        
        case 4:
            
            n = x * y - c
            c = x * y - n
            hint.text = String("X x \(y) = \(c) + \(n)")
            answer = x
            
        default:
            print("This Code Should Never Run")
        }
        
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        
        
        switch userInput.text == String(answer) {
        case true:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            gameStart()
            userInput.text = nil
            questionsGottenRight.SharedInstance.questionsGotten += 1
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            
        default:
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            questionsWrong.sharedInstances.questionsIncorrect += 1
            elementarySchoolWrong.sharedInstance.eWrongAnswers += 1
        }
        print(answer)
        totalQuestions.sharedInstance.questionsAnswered += 1
        totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions += 1
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        answerDisplay.isHidden = true
        gameStart()
        print(answer)
    }
    
}
