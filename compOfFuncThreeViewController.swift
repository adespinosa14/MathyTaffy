//
//  compOfFuncThreeViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 7/4/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class compOfFuncThreeViewController: UIViewController {
    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var i = Int()
    var c = Int()
    var negativeNumber = Int()
    var gameDeterminate = Int()
    var answer = Int()
    var perfectSquares = [4, 9, 16, 25, 36, 49, 64, 81, 100, 121]
    var randomSquare = Int()
    //MARK: Game Start
    
    func gameStart(){
        
        x = Int(arc4random_uniform(12) + 1)
        y = Int(arc4random_uniform(12) + 1)
        i = Int(arc4random_uniform(1))
        c = Int(arc4random_uniform(12) + 1)
        negativeNumber = Int(arc4random_uniform(20))
        randomSquare = Int(arc4random_uniform(10))
        
        gameDeterminate = Int(arc4random_uniform(5) + 1)
        
        switch gameDeterminate {
        case 1:
            print("Case 1")
            hint.text = String("f(\(x)) = x² + \(c)")
            answer = x * x + c
        case 2:
            print("Case 2")
            hint.text = String("f(\(x)) = x³")
            answer = x * x * x
        case 3:
            print("Case 3")
            hint.text = String("f(\(negativeNumber - 15)) = |x| + \(y)")
            answer = Int((negativeNumber - 15) * -1 + y)
        case 4:
            print("Case 4")
            hint.text = String("f(\(x)) = x² - \(c)")
            answer = Int(x * x - c)
        case 5:
            print("Case 5")
            hint.text = String("√(\(perfectSquares[randomSquare])) x \(x)")
            answer = Int(Float(perfectSquares[randomSquare]).squareRoot()) * x
        default:
            print("This Code Should Never Run")
        }
        print(answer)
        
    }
    
    //MARK: Submit Answers
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == String(answer){
            
        case true:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            gameStart()
            userInput.text = nil
            questionsGottenRight.SharedInstance.questionsGotten += 1
            highCorrectAnswers.sharedInstance.highCorrect += 1
            
        default:
         
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }
        totalQuestions.sharedInstance.questionsAnswered += 1
        highSchoolTotalQuestions.sharedInstance.highQuestionsTotal += 1
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerDisplay.isHidden = true
        gameStart()
        print(answer)
        
    }
    

}
