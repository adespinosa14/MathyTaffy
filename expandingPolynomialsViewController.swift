//
//  expandingPolynomialsViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/27/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class expandingPolynomialsViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var gameDependant = Int()
    var answer = String()
    
    //MARK: Game Start
    
    func gameStart(){
        
        x = Int(arc4random_uniform(9) + 5)
        y = Int(arc4random_uniform(9) + 1)
        gameDependant = Int(arc4random_uniform(2) + 1)
        
        switch gameDependant{
            
        case 1:
            
            hint.text = String("(\(x)x + \(y))²")
            answer = String("\(x * x)x²+\((x * y) + (x * y))x+\(y * y)")
            break
        case 2:
            hint.text = String("(\(x)x - \(y))²")
            if (x * -y) - (x * y) < 0{
            answer = String("\(x * x)x²\((x * -y) - (x * y))x+\(y * y)")
            }else{
            answer = String("\(x * x)x²+\((x * -y) - (x * -y))x+\(x * y)")
            }
        default:
            
            print("This Code Should Not Run")
            
        }
        
    }
    
    
    @IBAction func xSquaredPressed(_ sender: Any) {
        
        if(userInput.text == nil){
            
            userInput.text = String("x²")
            
        }else{
            
            userInput.text = String("\(userInput.text!)x²")
            
        }
        
        
    }
    
    //MARK: Submit Answers
    
    @IBAction func submitAnswer(_ sender: Any) {
        
        switch userInput.text == answer{
            
        case true:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            userInput.text = nil
            gameStart()
            highCorrectAnswers.sharedInstance.highCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            
        default:
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            questionsWrong.sharedInstances.questionsIncorrect += 1
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            
        }
        
        totalQuestions.sharedInstance.questionsAnswered += 1
        highSchoolTotalQuestions.sharedInstance.highQuestionsTotal += 1
        print(answer)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameStart()
        answerDisplay.isHidden = true
        print(answer)
        
    }

}
