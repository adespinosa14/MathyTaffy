//
//  evenOrOddViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/22/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class evenOrOddViewController: UIViewController {

    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var answer = String()
    var answerTwo = String()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(99) + 1)
        hint.text = "Even or Odd: \(x)"
        
        switch x.isMultiple(of: 2) {
        case true:
            print("\(x) is even")
            answer = "Even"
            answerTwo = "even"
        default:
            answer = "Odd"
            answerTwo = "odd"
        }
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text {
        case answer:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            gameStart()
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            userInput.text = nil
            
            break
        case answerTwo:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            gameStart()
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            userInput.text = nil
            
        default:
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            elementarySchoolWrong.sharedInstance.eWrongAnswers += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }
        
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
        
    }
    

}
