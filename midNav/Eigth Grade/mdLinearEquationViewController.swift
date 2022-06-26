//
//  mdLinearEquationViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 2/15/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class mdLinearEquationViewController: UIViewController {

    
    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    @IBAction func popUpInfoLinear(_sender: UIStoryboardSegue){}
    
    var taffyBucks = 0
    
     var equationChooser = Int()
       
       var answer = Float()
       var equationDispense = Int()
       var variableMultiple = Float()
       var b = Float()
       
       var variableMultipleTwo = Float()
       var bTwo = Float()
       
       func equationPicker(){
           
           equationChooser = Int(arc4random_uniform(3))
           
           switch equationChooser {
           case 0:
               
               print(equationChooser)
               equationDispense = 1
               
           case 1:
           
               print(equationChooser)
               equationDispense = 2
               
           case 2:
               
               print(equationChooser)
               equationDispense = 3
               
           default:
               print("Not Working | equationPicker()")
           }
           
       }
       
       func gameStart(){
           
           equationPicker()
           
           switch equationDispense{
               
           case 1:
               
               variableMultiple = 0
               b = Float(arc4random_uniform(20) + 1)
               bTwo = Float(arc4random_uniform(20) + 1)
               hint.text = String("x + \(b) = \(bTwo)")
               
               answer = Float(bTwo - b)
           case 2:
               
               variableMultiple = Float(arc4random_uniform(1) + 2)
               variableMultipleTwo = Float(arc4random_uniform(2) + 1)
               hint.text = String("\(variableMultiple)x = \(variableMultipleTwo)")
               
               answer = Float(variableMultipleTwo / variableMultiple)
           case 3:
               
               b = Float(arc4random_uniform(20) + 1)
               variableMultiple = Float(arc4random_uniform(1) + 1)
               bTwo = Float(arc4random_uniform(20)) + Float(1)
               variableMultipleTwo = Float(arc4random_uniform(3) + 1)
               
               hint.text = String("\(variableMultiple)x + \(b) = \(variableMultipleTwo) + \(bTwo)")
               
               answer = Float(variableMultipleTwo + bTwo - b / variableMultiple)
           default:
               
               print("Not Working | gameStart()")
               
           }
           
           print(Float(answer))
       }
       
    @IBAction func submit(_ sender: Any) {
        
        if(userInput.text == String(answer)){
            
            gameStart()
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameStart()
        answerDisplay.isHidden = true
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
}
