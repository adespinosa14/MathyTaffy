//
//  subtractionViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 1/31/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class subtractionViewController: UIViewController {

    var x = Int()
    var y = Int()
    var taffyBucks = 0
    var answer = Int()
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    
    func gameStart(){
        
        x = Int(arc4random_uniform(9) + 10)
        y = Int(arc4random_uniform(9) + 1)
        answer = Int(x - y)
        hint.text = String("\(x) - \(y) = _")
        
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        answerDisplay.isHidden = false
        if(userInput.text == String(answer)){
            
            answerDisplay.text = "Correct"
            userInput.text = nil
            gameStart()
            questionsGottenRight.SharedInstance.questionsGotten += 1
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            //taffyBucks += 1
            
            if(taffyBucks.isMultiple(of: 3)){
                
                purchasable.sharedInstance.taffyBucks += 1
                
            }
            
        }else if(userInput.text != String(answer)){
            
            answerDisplay.text = "Sorry, Try Again"
            userInput.text = nil
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
}
