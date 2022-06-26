//
//  multiplicationWordProblemsViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/22/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class multiplicationWordProblemsViewController: UIViewController {

    @IBOutlet var hint: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var answerDisplay: UILabel!
    
    var x = Int()
    var y = Int()
    var gameDeterminate = Int()
    var answer = Int()
    
    func gameStart(){
        
        x = Int(arc4random_uniform(8) + 2)
        y = Int(arc4random_uniform(7) + 3)
        gameDeterminate = Int(arc4random_uniform(6) + 1)
        
        switch gameDeterminate {
            
        case 1:
            
            hint.text = String("If I have \(x) bananas, then how many strawberries do I have if I have \(y) times more strawberries than bananas?")
            print("If I have \(x) bananas, then how many strawberries do I have if I have \(y) times more strawberries than bananas?")
            
            answer = x * y
            break
            
        case 2:
            
            hint.text = String("If I have \(x) red cars, how many blue cars do I have if I have twice as many blue cars than red cars?")
            print("If I have \(x) red cars, how many blue cars do I have if I have twice as many blue cars than red cars?")
            
            answer = x * 2
            break
            
        case 3:
            
            hint.text = String("If I have \(x) red cars, how many blue cars do I have if I have \(y) as many blue cars than red cars?")
            print("If I have \(x) red cars, how many blue cars do I have if I have \(y) time as many blue cars than red cars?")
            answer = x * y
            break
            
        case 4:
            
            hint.text = String("If I have \(x) bananas, then how many strawberries do I have if I have twice the amount of strawberries to bananas?")
            print("If I have \(x) bananas, then how many strawberries do I have if I have twice the amount of strawberries to bananas?")
            answer = x * 2
            break
            
        case 5:
            
            hint.text = String("I have \(x) pencils, but I need to buy double the amount of pens to complete my set. How many pens do I need to complete my set?")
            print("I have \(x) pencils, but I need to buy double the amount of pens to complete my set. How many pens do I need to complete my set?")
            answer = x * 2
        
        case 6:
            
            hint.text = String("I have \(x) pencils, but I need to buy \(y) times the amount of pens to complete my set. How many pens do I need to complete my set?")
            print("I have \(x) pencils, but I need to buy \(y) times the amount of pens to complete my set. How many pens do I need to complete my set?")
            answer = x * y
            
        default:
            
            print("This Code Should Never Run")
            
        }
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        switch userInput.text == String(answer) {
        case true:
            
            userInput.text = nil
            answerDisplay.text = "Correct"
            answerDisplay.isHidden = false
            gameStart()
            elementarySchoolCorrect.sharedInstance.eCorrect += 1
            questionsGottenRight.SharedInstance.questionsGotten += 1
            
        default:
            
            answerDisplay.text = "Sorry, Try Again"
            answerDisplay.isHidden = false
            questionsWrong.sharedInstances.questionsIncorrect += 1
            elementarySchoolWrong.sharedInstance.eWrongAnswers += 1
            
        }
        
        totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions += 1
        totalQuestions.sharedInstance.questionsAnswered += 1
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStart()
        answerDisplay.isHidden = true
        
    }

}
