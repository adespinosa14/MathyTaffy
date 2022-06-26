//
//  addingRationalSeventhViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 7/5/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class addingRationalSeventhViewController: UIViewController {
    
    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var answer = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(11) + 10)
        
        hint.text = String("If \(x) - \(x) = 0, Then \(x) + _ = 0")

        answer = x * -1
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == String(answer){
            
        case true:
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            gameStart()
            userInput.text = nil
            middleCorrectQuestions.sharedInstance.midCorrectAnswer += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            
        default:
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            questionsWrong.sharedInstances.questionsIncorrect += 1
            middleIncorrectAnswers.sharedInstance.midIncorrectAnswers += 1
            
        }
        totalQuestions.sharedInstance.questionsAnswered += 1
        middleTotalQuestions.sharedInstance.midTotalQuestions += 1
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStart()
        answerDisplay.isHidden = true
        
    }
    
    
}
