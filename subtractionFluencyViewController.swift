//
//  subtractionFluencyViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/22/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class subtractionFluencyViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var answer = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(9) + 10)
        y = Int(arc4random_uniform(9) + 1)
        answer = x - y
        print(answer)
        hint.text = String("\(x) - \(y) = _")
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == String(answer) {
        case true:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            gameStart()
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            userInput.text = nil
            
        default:
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            questionsWrong.sharedInstances.questionsIncorrect += 1
            elementarySchoolWrong.sharedInstance.eWrongAnswers += 1
            
            
        }
        
        totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions += 1
        
        totalQuestions.sharedInstance.questionsAnswered += 1
        
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
