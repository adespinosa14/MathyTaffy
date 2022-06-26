//
//  midGeometryViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 2/15/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class midGeometryViewController: UIViewController {
    
    @IBOutlet var aLeg: UILabel!
    @IBOutlet var bLeg: UILabel!
    @IBOutlet var cLeg: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    @IBAction func geometryBack(_sender: UIStoryboardSegue){}
    
    var a = Int()
    var b = Int()
    var c = Int()
    var taffyBucks = 0
    var pTheoremNoC = Int()
    var answer = Float()
    var gameDet = Int()
    
    func gameStart(){
        
        gameDet = Int(arc4random_uniform(3))
        
        if (gameDet == 0){
            
            a = Int(arc4random_uniform(12) + 1)
            b = Int(arc4random_uniform(12) + 1)
            
            aLeg.text = "\(a)"
            bLeg.text = "\(b)"
            cLeg.text = "C"
            
            pTheoremNoC = Int(a*a) + Int(b*b)
            answer = sqrt(Float(pTheoremNoC)).rounded()
            
        }else if(gameDet == 1){
            
            a = Int(arc4random_uniform(12) + 1)
            c = Int(arc4random_uniform(12) + 1)
            
            aLeg.text = "\(a)"
            cLeg.text = "\(c)"
            bLeg.text = "B"
            
            pTheoremNoC = Int(c*c) - Int(a*a)
            
            answer = sqrt(Float(pTheoremNoC)).rounded()
            
        }else if(gameDet == 2){
            
            b = Int(arc4random_uniform(12) + 1)
            c = Int(arc4random_uniform(12) + 1)
            
            bLeg.text = "\(b)"
            cLeg.text = "\(c)"
            aLeg.text = "A"
            
            pTheoremNoC = Int(c*c) - Int(b*b)
            
            answer = sqrt(Float(pTheoremNoC)).rounded()
            
        }
        
    }
    
    @IBAction func submit(_ sender: Any) {
        
        print("Hello There")
        
        print("Game Det: \(gameDet)")
        print(answer)
        
        if(userInput.text == String(answer)){
            
            answerDisplay.isHidden = false
            answerDisplay.text = "Correct"
            userInput.text = nil
            gameStart()
            questionsGottenRight.SharedInstance.questionsGotten += 1
            middleCorrectQuestions.sharedInstance.midCorrectAnswer += 1
            //taffyBucks += 1
            
            if(taffyBucks.isMultiple(of: 3)){
                
                purchasable.sharedInstance.taffyBucks += 1
                
            }
            
        }else{
            
            answerDisplay.isHidden = false
            answerDisplay.text = "Sorry, Try Again"
            questionsWrong.sharedInstances.questionsIncorrect += 1
            middleIncorrectAnswers.sharedInstance.midIncorrectAnswers += 1
            
        }
        
        middleTotalQuestions.sharedInstance.midTotalQuestions += 1
        totalQuestions.sharedInstance.questionsAnswered += 1
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("gameDet: \(gameDet)")
        print("Answer: \(answer)")
        print("pTheoremNoC: \(pTheoremNoC)")
        answerDisplay.isHidden = true
        
        gameStart()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
}
