//
//  subtractionFractionViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/2/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class subtractionFractionViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    @IBOutlet var submit: UIButton!
    
    var numeratorA = Int()
    var denominatorA = Int()
    
    var numeratorB = Int()
    var denominatorB = Int()
    
    var answerNumeratorA = Int()
    var answerDenominatorA = Int()
    
    var answerNumeratorB = Int()
    var answerDenominatorB = Int()
    
    var difinitiveAnswerA = Int()
    var difinitiveAnswerB = Int()
    var finalAnswer = String()
    
    var i = Int()
    var gameChange = 0
    var greatestCommonFactor = [1]
    
    var taffyBucks = 0
    
    func game(){
        
        numeratorA = Int(arc4random_uniform(11) + 1)
        denominatorA = Int(arc4random_uniform(11) + 1)
        
        numeratorB = Int(arc4random_uniform(11) + 1)
        denominatorB = Int(arc4random_uniform(11) + 1)
        
        if denominatorA == denominatorB{
            
            finalAnswer = String("\(numeratorA - numeratorB)/\(denominatorA)")
            
            hint.text = String("\(numeratorA)/\(denominatorA) - \(numeratorB)/\(denominatorB)")
            gameChange = 0
            
        }else if denominatorA != denominatorB{
            
            answerNumeratorA = numeratorA * denominatorB
            answerDenominatorA = denominatorA * denominatorB
            
            answerNumeratorB = numeratorB * denominatorA
            answerDenominatorB = denominatorB * denominatorA
            
            difinitiveAnswerA = answerNumeratorA - answerNumeratorB
            difinitiveAnswerB = answerDenominatorA
            
            hint.text = String("\(numeratorA)/\(denominatorA) - \(numeratorB)/\(denominatorB)")
            
            gameChange = 1
            
        }
        
        while(i < 100){
            
            if difinitiveAnswerA.isMultiple(of: i)  && difinitiveAnswerB.isMultiple(of: i) {
                
                greatestCommonFactor.append(i)
                print(greatestCommonFactor)
                
            }else{
                
                finalAnswer = String("\(difinitiveAnswerA)/\(difinitiveAnswerB)")
                
            }
            
            i += 1
        }
        
        if gameChange == 1{
        print("This is the greatest common factor: \(greatestCommonFactor.last!)")
        
        difinitiveAnswerA /= greatestCommonFactor.last!
        difinitiveAnswerB /= greatestCommonFactor.last!
        
        finalAnswer = String("\(difinitiveAnswerA)/\(difinitiveAnswerB)")
            
        }else if gameChange == 0 {
            
            difinitiveAnswerA = numeratorA - numeratorB
            difinitiveAnswerA /= greatestCommonFactor.last!
            denominatorA /= greatestCommonFactor.last!
            
            finalAnswer = String("\(difinitiveAnswerA)/\(denominatorA)")
            
        }
        
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        
        if(userInput.text == String("\(finalAnswer)")){
            
            game()
            print("Fractions: \(numeratorA)/\(denominatorA) - \(numeratorB)/\(denominatorB)")
            print(finalAnswer)
            i = 0
            answerDisplay.text = "Correct!"
            answerDisplay.isHidden = false
            userInput.text = nil
            questionsGottenRight.SharedInstance.questionsGotten += 1
            middleCorrectQuestions.sharedInstance.midCorrectAnswer += 1
            //taffyBucks += 1
            
            if(taffyBucks.isMultiple(of: 3)){
                
                purchasable.sharedInstance.taffyBucks += 1
                
            }
            
        }else{
            
            answerDisplay.text = "Sorry, Try Again!"
            answerDisplay.isHidden = false
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
        i = 0
        greatestCommonFactor = [1]
        print("Fractions: \(numeratorA)/\(denominatorA) - \(numeratorB)/\(denominatorB)")
        print(finalAnswer)
        
    }

}
