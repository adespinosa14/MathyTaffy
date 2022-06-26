//
//  expressionsViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/23/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class expressionsViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var z = Int()
    var answer = Int()
    var finalAnswer = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(11) + 2)
        y = Int(arc4random_uniform(99) + 1)
        z = Int(arc4random_uniform(99) + 1)
        
        hint.text = String("\(x) x (\(y) + \(z))")
        answer = y + z
        finalAnswer = answer * x
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == String(finalAnswer){
            
        case true:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            userInput.text = nil
            gameStart()
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            
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
        print(answer)
        gameStart()
        
    }

}
