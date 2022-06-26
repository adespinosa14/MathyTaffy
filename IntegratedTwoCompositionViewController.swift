//
//  IntegratedTwoCompositionViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/10/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class IntegratedTwoCompositionViewController: UIViewController {

    @IBOutlet weak var hintOne: UILabel!
       @IBOutlet weak var hintTwo: UILabel!
       @IBOutlet weak var hintOperation: UILabel!
       @IBOutlet weak var userInput: UITextField!
       @IBOutlet weak var submit: UIButton!
       @IBOutlet weak var answerDisplay: UILabel!
       
       
          var taffyBucks = 0
          var fTitle = ""
          var fInt = 0
          var random = 0
          var randomF = 0
          var yintF = false
          var bF = 0
          var additionF = false
          var aF = 0
          
          var subtractionF = false
          var sF = 0
          var multiplicationF = false
          var mF = 0
          
          var quadraticF = true
          var fQ = 0
          // g(x)
          
          var gInt = 0
          var gTitle = ""
          var randomG = 0
          var yintG = false
          var bG = 0
          var additionG = false
          var aG = 0
          
          var subtractionG = false
          var sG = 0
          var multiplicationG = false
          var mG = 0
          
          var answer = 0
          var f = 0
          var g = 0
          
          var quadraticG = true
          var gQ = 0
          
          //Order of Operation
          var randomOop = 0
          var linear = false
          var quadratic = false
          
          //Detection
          
          func randomOptions(){
              
              // f(x)
              
              random = Int(arc4random_uniform(3))
              randomF = Int(arc4random_uniform(11))
              randomOop = Int(arc4random_uniform(2))
              
              if(randomOop == 0){
                  linear = true
                  quadratic = false
              }else if(randomOop == 1){
                  linear = false
                  quadratic = true
              }
              
              if(random == 0){
                  additionF = true
                  subtractionF = false
                  multiplicationF = false
              }else if(random == 1){
                  additionF = false
                  subtractionF = true
                  multiplicationF = false
              }else if(random == 2){
                  additionF = false
                  subtractionF = false
                  multiplicationF = true
              }
              
              
              if(randomF <= 5){
                  yintF = true
              }else{
                  yintF = false
              }
              
              //g(x)
              
              randomG = Int(arc4random_uniform(11))
              
              if(random == 0){
                  additionG = true
                  subtractionG = false
                  multiplicationG = false
              }else if(random == 1){
                  additionG = false
                  subtractionG = true
                  multiplicationG = false
              }else if(random == 2){
                  additionG = false
                  subtractionG = false
                  multiplicationG = true
              }
              
              if(randomF <= 5){
                  yintG = true
              }else{
                  yintG = false
              }
              
          }
          
          // Core Level
          
          
          func levelOne(){
              
              randomOptions()
              fInt = Int(arc4random_uniform(9))
              aF = Int(arc4random_uniform(11))
              sF = Int(arc4random_uniform(11))
              mF = Int(arc4random_uniform(11))
              bF = Int(arc4random_uniform(11))
              //f(x)
              if(linear == true){
              if(yintF == false){
                  
                  hintOne.text = String("f(x) = \(aF)x")
                  f = Int(fInt * aF)
                  
              }else if(yintF == true){
                  
                  hintOne.text = String("f(x) = \(aF)x + \(bF)")
                  f = Int(fInt * aF + bF)
                  
              }
          }
              
              if(quadratic == true){
                  
                  if(yintF == false){
                      
                      hintOne.text = String("f(x) = \(aF)x²")
                      f = Int(fInt * fInt * aF)
                      
                  }else if(yintF == true){
                      
                      hintOne.text = String("f(x) = \(aF)x² + \(bF)")
                      f = Int(fInt * fInt * aF + bF)
                      
                  }
              }
              
              // g(x)
              
              aG = Int(arc4random_uniform(11))
              gInt = Int(arc4random_uniform(11))
              
              if(linear == true){
              if(yintG == false){
                  
                  hintTwo.text = String("g(x) = \(aG)x")
                  g = Int(gInt * aG)
                  
              }else if(yintG == true){
                  
                  hintTwo.text = String("g(x) = \(aG)x + \(bG)")
                  g = Int(gInt * aG + bG)
                  
              }
                  
          }
              
              if(quadratic == true){
                  
                  if(yintG == false){
                      
                      hintTwo.text = String("g(x) = \(aG)x²")
                      g = Int(gInt * gInt * aG)
                      
                  }else if(yintG == true){
                      
                      hintTwo.text = String("g(x) = \(aG)x² + \(bG)")
                      g = Int(gInt * gInt * aG + bG)
                      
                  }
              }
              
              // Universal
              if(additionF == true){
                  hintOperation.text = String("f(\(fInt))  +  g(\(gInt))")
                  answer = Int(f + g)
                  
              }
              
              if(subtractionF == true){
                  hintOperation.text = String("f(\(fInt))  -  g(\(gInt))")
                  answer = Int(f - g)
              }
              
              if(multiplicationF == true){
                  hintOperation.text = String("f(\(fInt))  x  g(\(gInt))")
                  answer = Int(f * g)
              }
              
              
              print(answer)
              
          }
       
       
       @IBAction func submitButton(_ sender: Any) {
           
           print(answer)
           print("f = \(f)")
           print("g  = \(g)")
        
           if(userInput.text == String(answer)){
            
                levelOne()
                answerDisplay.text = "Correct"
                answerDisplay.isHidden = false
                userInput.text = nil
                highCorrectAnswers.sharedInstance.highCorrect += 1
                questionsGottenRight.SharedInstance.questionsGotten += 1
                //taffyBucks += 1
            
            if(taffyBucks.isMultiple(of: 3)){
                
                purchasable.sharedInstance.taffyBucks += 1
                
            }
            
           }else if(userInput.text != String(answer)){
            
                answerDisplay.text = "Try Again!"
                answerDisplay.isHidden = false
                highincorrectAnswers.sharedInstance.highIncorrect += 1
                questionsWrong.sharedInstances.questionsIncorrect += 1
            
           }
        
            highSchoolTotalQuestions.sharedInstance.highQuestionsTotal += 1
            totalQuestions.sharedInstance.questionsAnswered += 1
           
       }
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
        
           answerDisplay.isHidden = true
           
       }
       
       override func viewDidAppear(_ animated: Bool) {
        
            levelOne()
            print(answer)
            print("f = \(f)")
            print("g  = \(g)")
           
       }
}
