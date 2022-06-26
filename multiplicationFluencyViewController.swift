//
//  multiplicationFluencyViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/23/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class multiplicationFluencyViewController: UIViewController {
    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var answer = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(899) + 100)
        y = Int(arc4random_uniform(899) + 100)
        hint.text = String("\(x) x \(y)")
        answer = x * y
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == String(answer){
            
        case true:
            
            answerDisplay.isHidden = false
            answerDisplay.text = "Correct"
            userInput.text = nil
            gameStart()
            questionsGottenRight.SharedInstance.questionsGotten += 1
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            
        default:
            
            answerDisplay.isHidden = false
            answerDisplay.text = "Sorry, Try Again"
            questionsWrong.sharedInstances.questionsIncorrect += 1
            elementarySchoolWrong.sharedInstance.eWrongAnswers += 1
            
        }
        totalQuestions.sharedInstance.questionsAnswered += 1
        totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions += 1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerDisplay.isHidden = true
        gameStart()
        
    }
    
}
