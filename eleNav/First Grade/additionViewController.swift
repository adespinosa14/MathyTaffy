//
//  additionViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 1/26/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class additionViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var answerDisplay: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var verdict: UILabel!
    
    var x = Int()
    var y = Int()
    var taffyBucks = 0
    var answer = Int()
    var answerDisplayValue = String()
    var questionsAnswered = 0
    
    
    func gameBegin (){
        
        x = Int(arc4random_uniform(9) + 1)
        y = Int(arc4random_uniform(9) + 1)
        answer = Int(x + y)
        answerDisplay.text = String("\(x) + \(y) = _")
        
    }
    
    @IBAction func answerCorrect(_ sender: Any) {
        
        verdict.isHidden = false
        
       if (userInput.text == String(answer)){
            
            verdict.text = "Correct"
            gameBegin()
            userInput.text = nil
            questionsGottenRight.SharedInstance.questionsGotten += 1
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
       // taffyBucks += 1
        
        if(taffyBucks.isMultiple(of: 3)){
            
            purchasable.sharedInstance.taffyBucks += 1
            
        }
        
            print(questionsAnswered)
        }else if(userInput.text != String(answer)){
            
            verdict.text = "Sorry, Try Again"
            userInput.text = nil
        questionsWrong.sharedInstances.questionsIncorrect += 1
        elementarySchoolWrong.sharedInstance.eWrongAnswers += 1
        
        }
        
        totalQuestions.sharedInstance.questionsAnswered += 1
        totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions += 1
        
        questionsAnswered += 1
        print(questionsAnswered)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameBegin()
        userInput.placeholder = "Enter Value"
        verdict.isHidden = true

        //self.userInput.delegate = self
        
    }
 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
}
