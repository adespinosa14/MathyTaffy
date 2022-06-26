    //
//  divisionFractionViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/2/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class divisionFractionViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var submit: UIButton!
    @IBOutlet var answerDisplay: UILabel!
    
    var numeratorA = Int()
    var numeratorB = Int()
    var definitiveA = Int()
    
    var denominatorA = Int()
    var denominatorB = Int()
    var definitiveB = Int()
    
    var answer = Int()
    var finalAnswer = String()
    
    var greatestCommonFactor = [1]
    var i = Int(0)
    
    var taffyBucks = 0
    
    func game(){
        
        numeratorA = Int(arc4random_uniform(11) + 1)
        numeratorB = Int(arc4random_uniform(11) + 1)
        denominatorA = Int(arc4random_uniform(11) + 1)
        denominatorB = Int(arc4random_uniform(11) + 1)
        
        hint.text = String("\(numeratorA)/\(denominatorA) ÷ \(numeratorB)/\(denominatorB)")
        
        definitiveA = numeratorA * denominatorB
        definitiveB = numeratorB * denominatorA
        
        while i < 100{
            
            if(definitiveA.isMultiple(of: i) && definitiveB.isMultiple(of: i)){
                
                greatestCommonFactor.append(i)
                print(greatestCommonFactor)
                
            }
            
            i += 1
        }
        
        definitiveA /= greatestCommonFactor.last!
        definitiveB /= greatestCommonFactor.last!
        
        finalAnswer = String("\(definitiveA)/\(definitiveB)")
        
    }
    
    
    @IBAction func submitAnswer(_ sender: Any) {
        
        if(userInput.text == finalAnswer){
            
            game()
            answerDisplay.text = "Correct"
            print("This are the fractions: \(numeratorA)/\(denominatorA) ÷ \(numeratorB)/\(denominatorB)")
            print(finalAnswer)
            userInput.text = nil
            i = 0
            
            questionsGottenRight.SharedInstance.questionsGotten += 1
            middleCorrectQuestions.sharedInstance.midCorrectAnswer += 1
            //taffyBucks += 1
            
            if(taffyBucks.isMultiple(of: 3)){
                
                purchasable.sharedInstance.taffyBucks += 1
                
            }
            
        }else{
            
            answerDisplay.text = "Sorry, Try Again"
            questionsWrong.sharedInstances.questionsIncorrect += 1
            middleIncorrectAnswers.sharedInstance.midIncorrectAnswers += 1
            
        }
        
        middleTotalQuestions.sharedInstance.midTotalQuestions += 1
        totalQuestions.sharedInstance.questionsAnswered += 1
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        game()
        greatestCommonFactor = [1]
        print("This are the fractions: \(numeratorA)/\(denominatorA) ÷ \(numeratorB)/\(denominatorB)")
                  print(finalAnswer)
        i = 0
        
    }
    

}
