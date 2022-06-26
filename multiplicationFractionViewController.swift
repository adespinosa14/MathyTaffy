//
//  multiplicationFractionViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/2/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class multiplicationFractionViewController: UIViewController {
    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var submit: UIButton!
    @IBOutlet var answerDisplay: UILabel!
    
    var numeratorA = Int()
    var denominatorA = Int()
    var definitiveAnswerA = Int()
    
    var numeratorB = Int()
    var denominatorB = Int()
    var definitiveAnswerB = Int()
    
    var i = 0
    
    var finalAnswer = String()
    var greatestCommonFactor = [1]
    var taffyBucks = 0
    func game(){
        
        numeratorA = Int(arc4random_uniform(11) + 1)
        numeratorB = Int(arc4random_uniform(11) + 1)
        denominatorA = Int(arc4random_uniform(11) + 1)
        denominatorB = Int(arc4random_uniform(11) + 1)
        
        hint.text = String("\(numeratorA)/\(denominatorA) x \(numeratorB)/\(denominatorB)")
        
        definitiveAnswerA = numeratorA * numeratorB
        definitiveAnswerB = denominatorA * denominatorB
        
        while i < 100{
            
            if(definitiveAnswerA.isMultiple(of: i) && definitiveAnswerB.isMultiple(of: i)){
                
                greatestCommonFactor.append(i)
                print(greatestCommonFactor)
                
            }
            
           i += 1
        }
        
        definitiveAnswerA /= greatestCommonFactor.last!
        definitiveAnswerB /= greatestCommonFactor.last!
        
        finalAnswer = String("\(definitiveAnswerA)/\(definitiveAnswerB)")
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        
        if(userInput.text == finalAnswer){
            
            answerDisplay.text = "Correct"
            game()
            i = 0
            print("\(numeratorA)/\(denominatorA) x \(numeratorB)/\(denominatorB)")
            print(finalAnswer)
            userInput.text = nil
            questionsGottenRight.SharedInstance.questionsGotten += 1
            middleCorrectQuestions.sharedInstance.midCorrectAnswer += 1
            //taffyBucks += 1
            
            if(taffyBucks.isMultiple(of: 3)){
                
                purchasable.sharedInstance.taffyBucks += 1
                
            }
            
        }else{
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            questionsWrong.sharedInstances.questionsIncorrect += 1
            middleIncorrectAnswers.sharedInstance.midIncorrectAnswers += 1
            
        }
        
        middleTotalQuestions.sharedInstance.midTotalQuestions += 1
        totalQuestions.sharedInstance.questionsAnswered += 1
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        game()
        i = 0
        print("\(numeratorA)/\(denominatorA) x \(numeratorB)/\(denominatorB)")
        print(finalAnswer)
        answerDisplay.isHidden = false
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        i = 0
        answerDisplay.isHidden = true
        
    }

}
