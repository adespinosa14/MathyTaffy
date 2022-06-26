//
//  divisionViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 1/31/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit
class divisionViewController: UIViewController {

    var x = [12, 12, 12, 12, 12, 10, 10, 10, 10, 8, 8, 8, 8, 6, 6, 6, 6, 4, 4, 4 , 2, 2]
    var y = [12, 6, 4, 3, 1, 10, 5, 2, 1, 8, 4, 2, 1, 6, 3, 2, 1, 4, 2, 1, 2, 1]
    var answer = Int()
    var num1 = 0
    var num2 = 0
    var num3 = 0
    var num4 = 0
    var taffyBucks = 0
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!

    func gameStart(){
               
        num3 = Int(arc4random_uniform(22))
        num4 = Int(arc4random_uniform(3))
        num1 = x[num3]
        num2 = y[num3]
        
        answer = Int(num1 / num2)
        hint.text = String("\(num1) \u{00F7} \(num2)")
        
    }
    
    @IBAction func submit(_ sender: Any) {
        
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
            questionsWrong.sharedInstances.questionsIncorrect += 1
            elementarySchoolWrong.sharedInstance.eWrongAnswers += 1
            
        }
        
        totalQuestions.sharedInstance.questionsAnswered += 1
        totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions += 1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameStart()
        answerDisplay.isHidden = true
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
}
