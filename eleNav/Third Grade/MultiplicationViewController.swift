//
//  MultiplicationViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 1/27/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class MultiplicationViewController: UIViewController {

    @IBOutlet var hint: UILabel!
    @IBOutlet var answerDisplay: UILabel!
    @IBOutlet var userInput: UITextField!

    var x = Int()
    var y = Int()
    var taffyBucks = 0
    var answer = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(9) + 1)
        y = Int(arc4random_uniform(9) + 1)
        
        answer = x * y
        hint.text = String("\(x) x \(y) = _")
        
    }
    
    
    @IBAction func answerCorrect(_ sender: Any) {
        
        if(userInput.text == String(answer)){
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            userInput.text = nil
            gameStart()
            questionsGottenRight.SharedInstance.questionsGotten += 1
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            //taffyBucks += 1
            
            if(taffyBucks.isMultiple(of: 3)){
                
                purchasable.sharedInstance.taffyBucks += 1
                
            }
            
        }else{
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            userInput.text = nil
            questionsWrong.sharedInstances.questionsIncorrect += 1
            elementarySchoolWrong.sharedInstance.eWrongAnswers += 1
            
        }
        
        totalQuestions.sharedInstance.questionsAnswered += 1
        totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions += 1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStart()
        userInput.placeholder = "Enter Answer Here"
        answerDisplay.isHidden = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
}
