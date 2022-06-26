//
//  factoringAOneViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/28/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class factoringAOneViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var userInputTwo: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var answerOne = String()
    var polynomial = String()
    var answerTwo = String()
    var gameDeterminate = Int()
    
    //MARK: Game Start
    
    func gameStart(){
        
        x = Int(arc4random_uniform(5) + 1)
        y = Int(arc4random_uniform(5) + 1)
        gameDeterminate = Int(arc4random_uniform(3) + 1)
        
        switch gameDeterminate{
            
        case 1:
            
            hint.text = String("x² + \(y + x)x + \(x * y)")
            polynomial = String("(x + \(x))(x + \(y))")
            answerOne = String("\(-x)")
            answerTwo = String("\(-y)")

            break
        case 2:
            
            polynomial = String("(x - \(x))(x + \(y))")
            answerOne = String("\(x)")
            answerTwo = String("\(-y)")
            
            if y - x < 0{
                
                hint.text = String("x²\(y - x)x-\(x * y)")
                
            }else if(y - x == 0){
                
                gameStart()
                
            }else{
                
                hint.text = String("x²+\(y - x)x-\(x * y)")
                
            }
            
            break
        case 3:
            
            polynomial = String("(x + \(x))(x - \(y))")
            answerOne = String("\(-x)")
            answerTwo = String("\(y)")
            if -y + x < 0{
                
                hint.text = String("x²\(-y + x)x-\(x * y)")
                
            }else if(-y + x == 0){
                
                gameStart()
                
            }else{
                
                hint.text = String("x²+\(-y + x)x-\(x * y)")
                
            }
            
        default:
            print("This Code Should Not Run")
            
        }
        
        print("gameDeterminate: \(gameDeterminate)")
        print("answerOne = \(answerOne)")
        print("answerTwo = \(answerTwo)")
        
    }
    
    //MARK: Correct Questions
    
    @IBAction func submitAnswerButton(_ sender: Any) {
     
        if(userInput.text == answerOne && userInputTwo.text == answerTwo){
            
            answerDisplay.text = "Correct"
            gameStart()
            answerDisplay.isHidden = false
            userInput.text = nil
            userInputTwo.text = nil
            highCorrectAnswers.sharedInstance.highCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            
        }else if(userInput.text == answerTwo && userInputTwo.text == answerOne){
            
            answerDisplay.text = "Correct"
            gameStart()
            answerDisplay.isHidden = false
            userInput.text = nil
            userInputTwo.text = nil
            highCorrectAnswers.sharedInstance.highCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            
        }else if(userInput.text != answerOne && userInputTwo.text == answerTwo){
            
            answerDisplay.text = "Close! Check Your First Answer"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }else if(userInput.text == answerOne && userInput.text != answerTwo){
            
            answerDisplay.text = "Close! Check Your Second Answer"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }else if(userInput.text != answerTwo && userInputTwo.text == answerOne){
            
            answerDisplay.text  = "Close! Check Your First Answer"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }else if(userInput.text == answerTwo && userInputTwo.text != answerOne){
            
            answerDisplay.text = "Close! Check Your Second Answer"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }else{
            
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

        gameStart()
        answerDisplay.isHidden = true
        print("gameDeterminate: \(gameDeterminate)")
        print("answerOne = \(answerOne)")
        print("answerTwo = \(answerTwo)")
        print("This is x: \(x)")
        print("This is y: \(y)")
        
    }
    
}
