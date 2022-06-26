//
//  subtractionDecimalsViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/23/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class subtractionDecimalsViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Float()
    var y = Float()
    var z = Float()
    var n = Float()
    
    var numOne = Float()
    var numTwo = Float()
    
    var answerOne = Float()
    var answerTwo = Float()
    var finalAnswer = Float()
    
    func gameStart(){
        
        x = Float(arc4random_uniform(50) + 50)
        y = Float(arc4random_uniform(24) + 1)
        
        z = Float(arc4random_uniform(49) + 1)
        n = Float(arc4random_uniform(24) + 1)
        
        numOne = Float(x/y)
        numTwo = Float(z/n)
        
        answerOne = Float(numOne * 1000).rounded() / 1000
        answerTwo = Float(numTwo * 1000).rounded() / 1000
        finalAnswer = Float(numOne * 1000 - numTwo * 1000).rounded() / 1000
        
        hint.text = String("\(Float(numOne * 1000).rounded() / 1000) - \(Float(numTwo * 1000).rounded() / 1000)")
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == String(finalAnswer) {
        case true:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            userInput.text = nil
            gameStart()
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            
        default:
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            elementarySchoolWrong.sharedInstance.eWrongAnswers += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }
        
        totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions += 1
        totalQuestions.sharedInstance.questionsAnswered += 1
        
        print(answerOne)
        print(answerTwo)
        print("This Is The Final Answer: \(finalAnswer)")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerDisplay.isHidden = true
        gameStart()
        print(answerOne)
        print(answerTwo)
        print("This Is The Final Answer: \(finalAnswer)")
        
    }
    
}
