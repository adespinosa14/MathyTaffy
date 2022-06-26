//
//  roundingElementaryViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/2/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class roundingElementaryViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var submit: UIButton!
    @IBOutlet var answerDisplay: UILabel!
    
    var randomInt = Int()
    var finalAnswer = Int()
    var taffyBucks = 0
    
    func game(){
        
        randomInt = Int(arc4random_uniform(20) + 1)
        
        hint.text = String("Find the nearest whole number: \(randomInt)")
        
        if(randomInt >= 5 && randomInt <= 10){
            
            finalAnswer = 10
            
        }else if(randomInt > 10 && randomInt < 15){
            
            finalAnswer = 10
            
        }else if(randomInt >= 15 && randomInt <= 20){
            
            finalAnswer = 20
            
        }else if(randomInt < 5){
            
            finalAnswer = 0
            
        }
        
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        if(userInput.text == String(finalAnswer)){
            
            answerDisplay.text = "Correct"
            game()
            answerDisplay.isHidden = false
            questionsGottenRight.SharedInstance.questionsGotten += 1
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            //taffyBucks += 1
            
            if(taffyBucks.isMultiple(of: 3)){
                
                purchasable.sharedInstance.taffyBucks += 1
                
            }
            
        }else{
            
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
    
    override func viewDidAppear(_ animated: Bool) {
        
        game()
        answerDisplay.isHidden = true
        print("This is the randomNumber: \(randomInt)")
        print("This is the answer: \(finalAnswer)")
        
    }
    

}
