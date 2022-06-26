//
//  highCompOfFuncViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 2/18/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class highCompOfFuncViewController: UIViewController {

    
    
    @IBOutlet weak var hintOne: UILabel!
    @IBOutlet weak var hintTwo: UILabel!
  //  @IBOutlet weak var hint: UIButton!
    @IBOutlet weak var hintOperation: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var answerDisplay: UILabel!

    
    var fTitle = ""
       var fInt = 0
       var random = 0
       var randomF = 0
       var yintF = false
       var bF = 0
       var additionF = false
       var aF = 0
       var taffyBucks = 0
    
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
       var linear = true
       var quadratic = false
       
       //Detection
       
       func randomOptions(){
           
           // f(x)
           
           random = Int(arc4random_uniform(3))
           randomF = Int(arc4random_uniform(11))
           randomOop = Int(arc4random_uniform(2))
           
           if(randomOop == 0){
               linear = true
           }else if(randomOop == 1){
               linear = true
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
           
           gInt = Int(arc4random_uniform(9))
           aG = Int(arc4random_uniform(11))
           sG = Int(arc4random_uniform(11))
           mG = Int(arc4random_uniform(11))
           bG = Int(arc4random_uniform(11))
           
           // Linear
           
           if (linear == true && bF > 1){
               hintOne.text = String("f(x) = \(aF)x + \(bF)")
               f = Int(aF * fInt + bF)
           }else if(linear == true && bF <= 1){
               hintOne.text = String("f(x) = \(aF)x")
               f = Int(aF * bF)
           }
           
           if (linear == true && bG > 1){
               hintTwo.text = String("g(x) = \(aG)x + \(bG)")
               g = Int(aG * gInt + bG)
           }else if (linear == true && bG <= 1){
               hintTwo.text = String("g(x) = \(aG)x")
               g = Int(aG * gInt)
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
       
       @IBAction func submit(_ sender: Any) {
           
           if(userInput.text == String(answer)){
               answerDisplay.text = "Correct"
               answerDisplay.isHidden = false
               userInput.text = nil
               levelOne()
               highCorrectAnswers.sharedInstance.highCorrect += 1
               questionsGottenRight.SharedInstance.questionsGotten += 1
               //taffyBucks += 1
            
            if(taffyBucks.isMultiple(of: 3)){
                
                purchasable.sharedInstance.taffyBucks += 1
                
            }
           }else if(userInput.text != String(answer)){
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
        
        levelOne()
        answerDisplay.isHidden = true
        userInput.isHidden = false
        submit.isHidden = false
        hintOne.isHidden = false
        hintTwo.isHidden = false
        hintOperation.isHidden = false
           
       }
}
