//
//  FOILViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/25/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class FOILViewController: UIViewController {
    
    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var z = Int()
    var c = Int()
    var answer = String()
    var gameDeterminate = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(9) + 1)
        y = Int(arc4random_uniform(6) + 5)
        z = Int(arc4random_uniform(9) + 1)
        c = Int(arc4random_uniform(9) + 1)
        gameDeterminate = Int(arc4random_uniform(8) + 1)
        
        switch gameDeterminate{
            
        case 1:
            
            hint.text = String("(x + \(x))(x + \(y))")
            answer = String("x² + \(y + x)x + \(x * y)")
            if y - x < 0{
                
                answer = String("x²\(y - x)x-\(x * y)")
                
            }else{
                
                answer = String("x²+\(y - x)x-\(x * y)")
                
            }

            break
        case 2:
            
            hint.text = String("(x - \(x))(x - \(y))")
            answer = String("x²-\(x + y)x+\(x * y)")
            
            if y - x < 0{
                
                answer = String("x²\(y - x)x-\(x * y)")
                
            }else{
                
                answer = String("x²+\(y - x)x-\(x * y)")
                
            }

            break
        case 3:
            
            hint.text = String("(x - \(x))(x + \(y))")
            answer = String("x²\(y - x)x-\(x * y)")
            
            if y - x < 0{
                
                answer = String("x²\(y - x)x-\(x * y)")
                
            }else{
                
                answer = String("x²+\(y - x)x-\(x * y)")
                
            }
            break
        case 4:
            
            hint.text = String("(x + \(x))(x - \(y))")
            if -y + x < 0{
                
                answer = String("x²\(-y + x)x-\(x * y)")
                
            }else{
                
                answer = String("x²+\(-y + x)x-\(x * y)")
                
            }

            break
        case 5:
            
            hint.text = String("(\(x)x + \(y))(\(z)x + \(c))")
                
                answer = String("\(x * z)x²+\((x * c) + (y * z))x+\(y * c)")
                

            break
        case 6:
            
            hint.text = String("(\(x)x - \(y))(\(z)x + \(c))")
            
            if (z * -y) + (x * c) < 0{
                
                answer = String("\(x * z)x²\((z * -y)+(x * c))x-\(y * c)")
                
            }else{
                
                answer = String("\(x * z)x²+\((z * -y)+(x * c))x-\(y * c)")
                
            }

            break
        case 7:
            
            hint.text = String("(\(x)x + \(y))(\(z)x - \(c))")
            
            if (z * y) + (x * -c) < 0{
                
                answer = String("\(x * z)x²\((z * y) + (x * -c))x-\(y * c)")
                
            }else{
                
                answer = String("\(x * z)x²+\((z * y)+(x * -c))x-\(y * c)")
                
            }

            break
            
        case 8:
            
             hint.text = String("(\(x)x - \(y))(\(z)x - \(c))")
             
            if y - x < 0{
                
                answer = String("\(x * z)x²-\((z * y)+(x * c))x + \(-y * -c)")
                
            }else{
                
                answer = String("\(x * z)x²-\((z * y)+(x * c))x+\(-y * -c)")
                
            }

            
        default:
            print("This Code Should Not Run")
            
        }
        print(answer)
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == answer {
        case true:
            
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            gameStart()
            userInput.text = nil
            highCorrectAnswers.sharedInstance.highCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            print(answer)
            
        default:
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            questionsWrong.sharedInstances.questionsIncorrect += 1
            
        }
        totalQuestions.sharedInstance.questionsAnswered += 1
        highSchoolTotalQuestions.sharedInstance.highQuestionsTotal += 1
        
    }
    
    @IBAction func xSquaredButton(_ sender: Any) {
        
        if userInput != nil{
            
        userInput.text = String("\(userInput.text!)x²")
            
        }else{
            
            userInput.text = String("x²")
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        answerDisplay.isHidden = false
        gameStart()
        
    }

}
