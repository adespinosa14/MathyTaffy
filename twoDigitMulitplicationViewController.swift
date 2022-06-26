//
//  twoDigitMulitplicationViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/22/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class twoDigitMulitplicationViewController: UIViewController {
    
    @IBOutlet var userInput: UITextField!
    @IBOutlet var hint: UILabel!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var answer = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(50) + 50)
        y = Int(arc4random_uniform(50) + 10)
        
        answer = x * y
        hint.text = String("\(x) x \(y)")
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == String(answer) {
        case true:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            userInput.text = nil
            gameStart()
            questionsGottenRight.SharedInstance.questionsGotten += 1
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            
        default:
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            questionsWrong.sharedInstances.questionsIncorrect += 1
            elementarySchoolWrong.sharedInstance.eWrongAnswers += 1
            
        }
        totalQuestions.sharedInstance.questionsAnswered += 1
        totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions += 1
        
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
