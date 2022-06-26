//
//  communitivePropertyOfAdditionViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/23/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class communitivePropertyOfAdditionViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    
    var answer = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(10) + 1)
        y = Int(arc4random_uniform(10) + 1)
        
        hint.text = String("If \(x) + \(y) = \(x + y), then \(y) + \(x) = _")
        
       answer = x + y
        
    }
    
    @IBAction func submit(_ sender: Any) {
        
        switch userInput.text == String(answer){
            
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
