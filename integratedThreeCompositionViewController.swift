//
//  integratedThreeCompositionViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/10/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class integratedThreeCompositionViewController: UIViewController {
    
    @IBOutlet var hintOne: UILabel!
    @IBOutlet var hintTwo: UILabel!
    @IBOutlet var hintOperation: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var taffyBucks = 0
    
    var aOne = Int()
    var bOne = Int()
    var aTwo = Int()
    var bTwo = Int()
    var aX = Int()
    var bX = Int()
    
    var random = Int()
    var orderOfOperation = Int()
    var negative = Int()
    
    var answerA = Int()
    var answerB = Int()
    
    var finalAnswer = Int()
    
    func gameStart(){
        
        random = Int(arc4random_uniform(4))
        aOne = Int(arc4random_uniform(12) + 1)
        bOne = Int(arc4random_uniform(12) + 1)
        aTwo = Int(arc4random_uniform(12) + 1)
        bTwo = Int(arc4random_uniform(12) + 1)
        aX = Int(arc4random_uniform(12) + 1)
        bX = Int(arc4random_uniform(12) + 1)
        
        negative = Int(arc4random_uniform(4))
        orderOfOperation = Int(arc4random_uniform(3))
        
        if(negative == 0){
            
            aX *= -1
            
        }else if(negative == 1){
            
            bX *= -1
            
        }else if(negative == 2){
            
            aX *= -1
            bX *= -1
            
        }else{
            
            print("No Negative Number")
            
        }
        
        switch random {
        case 0:
        
            if(orderOfOperation == 0){
                
                hintOne.text = String("f(x)=\(aOne)x + \(bOne)")
                hintTwo.text = String("g(x)=\(aTwo)x + \(bTwo)")
            
                answerA = Int(aOne * aX + bOne)
                answerB = Int(aTwo * bX + bTwo)
                hintOperation.text = String("f(\(aX)) + g(\(bX))")
                finalAnswer = answerA + answerB
                
            }else if(orderOfOperation == 1){
                
                hintOne.text = String("f(x)=\(aOne)x + \(bOne)")
                hintTwo.text = String("g(x)=\(aTwo)x + \(bTwo)")
            
                answerA = Int(aOne * aX + bOne)
                answerB = Int(aTwo * bX + bTwo)
                hintOperation.text = String("f(\(aX)) - g(\(bX))")
                finalAnswer = answerA - answerB
                print(finalAnswer)
                
            }else if(orderOfOperation == 2){
                
                hintOne.text = String("f(x)=\(aOne)x + \(bOne)")
                hintTwo.text = String("g(x)=\(aTwo)x + \(bTwo)")
            
                answerA = Int(aOne * aX + bOne)
                answerB = Int(aTwo * bX + bTwo)
                hintOperation.text = String("f(\(aX)) x g(\(bX))")
                finalAnswer = answerA * answerB
                print(finalAnswer)
                
            }
            
        break
            
        case 1:
            
            if(orderOfOperation == 0){
                hintOne.text = String("f(x)=\(aOne)x² + \(bOne)")
                hintTwo.text = String("g(x)=\(aTwo)x² + \(bTwo)")
            
                answerA = Int(aX * aX * aOne + bOne)
                answerB = Int(bX * bX * aTwo + bTwo)
                hintOperation.text = String("f(\(aX)) + g(\(bX))")
                finalAnswer = answerA + answerB
                print(finalAnswer)
            }else if(orderOfOperation == 1){
                
                hintOne.text = String("f(x)=\(aOne)x² + \(bOne)")
                hintTwo.text = String("g(x)=\(aTwo)x² + \(bTwo)")
                
                answerA = Int(aX * aX * aOne + bOne)
                answerB = Int(bX * bX * aTwo + bTwo)
                hintOperation.text = String("f(\(aX)) - g(\(bX))")
                finalAnswer = answerA - answerB
                print(finalAnswer)
                
            }else if(orderOfOperation == 2){
                
                hintOne.text = String("f(x)=\(aOne)x² + \(bOne)")
                hintTwo.text = String("g(x)=\(aTwo)x² + \(bTwo)")
                
                answerA = Int(aX * aX * aOne + bOne)
                answerB = Int(bX * bX * aTwo + bTwo)
                hintOperation.text = String("f(\(aX)) x g(\(bX))")
                finalAnswer = answerA * answerB
                print(finalAnswer)
                
            }
            
            break
        
        case 2:
            
            if(orderOfOperation == 0){
                
                hintOne.text = String("f(x)=\(aOne)x³ + \(bOne)")
                hintTwo.text = String("g(x)=\(aTwo)x³ + \(bTwo)")
                
                answerA = Int(aX * aX * aX * aOne + bOne)
                answerB = Int(bX * bX * bX * aTwo + bTwo)
                hintOperation.text = String("f(\(aX)) + g(\(bX))")
                finalAnswer = answerA + answerB
                print(finalAnswer)
                
            }else if(orderOfOperation == 1){
                
                hintOne.text = String("f(x)=\(aOne)x³ + \(bOne)")
                hintTwo.text = String("g(x)=\(aTwo)x³ + \(bTwo)")
                
                answerA = Int(aX * aX * aX * aOne + bOne)
                answerB = Int(bX * bX * bX * aTwo + bTwo)
                hintOperation.text = String("f(\(aX)) - g(\(bX))")
                finalAnswer = answerA - answerB
                print(finalAnswer)
                
            }else if(orderOfOperation == 2){
                
                hintOne.text = String("f(x)=\(aOne)x³ + \(bOne)")
                hintTwo.text = String("g(x)=\(aTwo)x³ + \(bTwo)")
                
                answerA = Int(aX * aX * aX * aOne + bOne)
                answerB = Int(bX * bX * bX * aTwo + bTwo)
                hintOperation.text = String("f(\(aX)) x g(\(bX))")
                finalAnswer = answerA * answerB
                print(finalAnswer)
                
            }
            
            break
        
    case 3:
            
        random = Int(arc4random_uniform(4))
        //aOne = Int(arc4random_uniform(24) - 12)
        //bOne = Int(arc4random_uniform(24) - 12)
        //aTwo = Int(arc4random_uniform(24) - 12)
       // bTwo = Int(arc4random_uniform(24) - 12)
        aX = Int(arc4random_uniform(12) + 1)
        bX = Int(arc4random_uniform(12) + 1)
        
        if(orderOfOperation == 0){
            
            hintOne.text = String("f(x)=|\(aOne)x| + \(bOne)")
            hintTwo.text = String("g(x)=|\(aTwo)x| + \(bTwo)")
            
            answerA = Int(aX * aOne + bOne)
            answerB = Int(bX * aTwo + bTwo)
            hintOperation.text = String("f(\(aX)) + g(\(bX))")
            
            if(answerA + answerB < 0){
                
                finalAnswer = answerA + answerB * -1
                print(finalAnswer)
                
            }else{
            
                finalAnswer = answerA + answerB
                print(finalAnswer)
                
             }
            
            
        }else if(orderOfOperation == 1){
            
            hintOne.text = String("f(x)=|\(aOne)x| + \(bOne)")
            hintTwo.text = String("g(x)=|\(aTwo)x| + \(bTwo)")
            
            answerA = Int(aX * aOne + bOne)
            answerB = Int(bX * aTwo + bTwo)
            hintOperation.text = String("f(\(aX)) - g(\(bX))")
            
            if(answerA + answerB < 0){
                
                finalAnswer = answerA - answerB * -1
                print(finalAnswer)
                
            }else{
            
                finalAnswer = answerA - answerB
                print(finalAnswer)
                
             }
            
        }else if(orderOfOperation == 2){
            
            hintOne.text = String("f(x)=|\(aOne)x| + \(bOne)")
            hintTwo.text = String("g(x)=|\(aTwo)x| + \(bTwo)")
            
            answerA = Int(aX * aOne + bOne)
            answerB = Int(bX * aTwo + bTwo)
            hintOperation.text = String("f(\(aX)) + g(\(bX))")
            
            if(answerA + answerB < 0){
                
                finalAnswer = answerA * answerB * -1
                print(finalAnswer)
                
            }else{
            
                finalAnswer = answerA * answerB
                print(finalAnswer)
                
             }
            
            }
            
            
            
        default:
            print("Hello There")
        }
        
    }
    
    
    @IBAction func submitAnswer(_ sender: Any) {
        
        if(userInput.text == String("\(finalAnswer)")){
            
            answerDisplay.text = String("Correct")
            gameStart()
            questionsGottenRight.SharedInstance.questionsGotten += 1
            highCorrectAnswers.sharedInstance.highCorrect += 1
            //taffyBucks += 1
            
            if(taffyBucks.isMultiple(of: 3)){
                
                purchasable.sharedInstance.taffyBucks += 1
                
            }
            
        }else{
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            questionsWrong.sharedInstances.questionsIncorrect += 1
            highincorrectAnswers.sharedInstance.highIncorrect += 1
            
        }
        
        totalQuestions.sharedInstance.questionsAnswered += 1
        highSchoolTotalQuestions.sharedInstance.highQuestionsTotal += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameStart()
        answerDisplay.isHidden = true
        print(finalAnswer)
        
    }

}
