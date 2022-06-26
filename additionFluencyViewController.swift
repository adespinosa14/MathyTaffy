//
//  additionFluencyViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/22/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class additionFluencyViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    @IBOutlet var submitButton: UIButton!
    
    var x = Int()
    var y = Int()
    var answer = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(9) + 1)
        y = Int(arc4random_uniform(9) + 1)
        
        hint.text = String("\(x) + \(y) = _")
        answer = Int(x + y)
        
    }
    
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == String("\(answer)") {
        case true:
            
            answerDisplay.text = "Correct"
            gameStart()
            answerDisplay.isHidden = false
            userInput.text = nil
            
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            
        default:
            
            answerDisplay.isHidden = false
            answerDisplay.text = "Sorry, Try Again"
            
            elementarySchoolWrong.sharedInstance.eWrongAnswers += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
        }
        
        totalQuestions.sharedInstance.questionsAnswered += 1
        totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions += 1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStart()
        answerDisplay.isHidden = true
        
    }
    
}
