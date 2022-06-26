//
//  analyticsViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 1/6/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class analyticsViewController: UIViewController {
    
//Total Labels
    @IBOutlet var questionsAttempted: UILabel!
    @IBOutlet var questionsCorrect: UILabel!
    @IBOutlet var answersIncorrectLabel: UILabel!
    @IBOutlet var totalAverage: UILabel!
    @IBOutlet var incorrectAverage: UILabel!
    @IBOutlet var resetButtonText: UIButton!
    
    
//Elementary School Analytics
    @IBOutlet var elementaryQuestionsAttempted: UILabel!
    @IBOutlet var elementaryQuestionsCorrect: UILabel!
    @IBOutlet var elementaryQuestionsWrong: UILabel!
    @IBOutlet var correctAverage: UILabel!
    @IBOutlet var eincorrectAverage: UILabel!
    
//Middle School Analytics
    @IBOutlet var midQuestionsAttempted: UILabel!
    @IBOutlet var midCorrectAnswers: UILabel!
    @IBOutlet var midIncorrectAnswers: UILabel!
    @IBOutlet var midCorrectAverage: UILabel!
    @IBOutlet var midIncorrectAverage: UILabel!
    
//High School Analytics
    
    @IBOutlet var highTotalQuestions: UILabel!
    @IBOutlet var highCorrectAnswer: UILabel!
    @IBOutlet var highIncorrectAnswers: UILabel!
    @IBOutlet var highCorrectAverage: UILabel!
    @IBOutlet var highIncorrectAverage: UILabel!
    
//Total Analytics Variables
    var totalAverageCalc = Float()
    var incorrectAverageCalc = Float()
    
//Elementary School Analytical Variables
    var etotalAverageCalc = Float()
    var eincorrectAverageCalc = Float()
    var areYouSure = 0
    
//Middle School Analytical Variables
    var midTotalAverageCalc = Float()
    var midIncorrectAverageCalc = Float()
    
    override func viewDidAppear(_ animated: Bool) {
        
// Total Analytics
        UserDefaults.standard.set(totalQuestions.sharedInstance.questionsAnswered, forKey: "totalQuestions")
        UserDefaults.standard.set(questionsGottenRight.SharedInstance.questionsGotten, forKey: "questionsRight")
        UserDefaults.standard.set(questionsWrong.sharedInstances.questionsIncorrect, forKey: "answersWrong")
        
        questionsAttempted.text = String("Total Questions Attempted:  \(totalQuestions.sharedInstance.questionsAnswered)")
        questionsCorrect.text = String("Total Correct Answers:  \(questionsGottenRight.SharedInstance.questionsGotten)")
        answersIncorrectLabel.text = String("Total Incorrect Answers: \(questionsWrong.sharedInstances.questionsIncorrect)")
        
        
// Elementary School Analytics
        UserDefaults.standard.set(totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions, forKey: "tElementary")
        elementaryQuestionsAttempted.text = String("Total Questions Attempted: \(totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions)")
        
        UserDefaults.standard.set(elementarySchoolCorrect.sharedInstance.eCorrect, forKey: "eCorrect")
        elementaryQuestionsCorrect.text = String("Total Correct Answers: \(elementarySchoolCorrect.sharedInstance.eCorrect)")
        
        UserDefaults.standard.set(elementarySchoolWrong.sharedInstance.eWrongAnswers, forKey: "eWrong")
        elementaryQuestionsWrong.text = String("Total Incorrect Answers: \(elementarySchoolWrong.sharedInstance.eWrongAnswers)")
        
// Middle School Analytics
        UserDefaults.standard.set(middleTotalQuestions.sharedInstance.midTotalQuestions, forKey: "midTotalQuestions")
        UserDefaults.standard.set(middleCorrectQuestions.sharedInstance.midCorrectAnswer, forKey: "midCorrectAnswers")
        UserDefaults.standard.set(middleIncorrectAnswers.sharedInstance.midIncorrectAnswers, forKey: "midIncorrectAnswers")
        
        midQuestionsAttempted.text = String("Total Questions Attempted: \(middleTotalQuestions.sharedInstance.midTotalQuestions)")
        midCorrectAnswers.text = String("Total Correct Answers: \(middleCorrectQuestions.sharedInstance.midCorrectAnswer)")
        midIncorrectAnswers.text = String("Total Incorrect Answers: \(middleIncorrectAnswers.sharedInstance.midIncorrectAnswers)")
        
        
// High School Analytics
        
        UserDefaults.standard.set(highSchoolTotalQuestions.sharedInstance.highQuestionsTotal, forKey: "highTotalQuestions")
        UserDefaults.standard.set(highCorrectAnswers.sharedInstance.highCorrect, forKey: "highCorrectQuestions")
        UserDefaults.standard.set(highincorrectAnswers.sharedInstance.highIncorrect, forKey: "highIncorrectQuestions")
        
        highTotalQuestions.text = String("Total Questions Attempted: \(highSchoolTotalQuestions.sharedInstance.highQuestionsTotal)")
        highCorrectAnswer.text = String("Total Correct Answers: \(highCorrectAnswers.sharedInstance.highCorrect)")
        highIncorrectAnswers.text = String("Total Incorrect Answers: \(highincorrectAnswers.sharedInstance.highIncorrect)")
        
// The Total Average
        if(totalQuestions.sharedInstance.questionsAnswered == 0 || questionsGottenRight.SharedInstance.questionsGotten == 0){
            
            totalAverage.text = "Total C/T: Sorry, Not Enough Data"
            
        }else{
            
            totalAverageCalc = Float(questionsGottenRight.SharedInstance.questionsGotten) / Float(totalQuestions.sharedInstance.questionsAnswered)
            
            
            
            totalAverage.text = String("Total C/T: \(Float(totalAverageCalc) * 100)%")
            
        }
        
        if(questionsWrong.sharedInstances.questionsIncorrect == 0 || totalQuestions.sharedInstance.questionsAnswered == 0){
            
            print("There is not enough data: I/T")
            incorrectAverage.text = "Total I/T: Sorry, Not Enough Data"
        }else{
            
            incorrectAverageCalc = Float(questionsWrong.sharedInstances.questionsIncorrect) / Float(totalQuestions.sharedInstance.questionsAnswered)
            
            incorrectAverage.text = String("Total I/T: \(Float(incorrectAverageCalc) * 100)%")
            
        }
        
// Elementary School Average
        
        if(elementarySchoolCorrect.sharedInstance.eCorrect == 0 || totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions == 0){
            
            correctAverage.text = "Total C/T: Sorry, Not Enough Data"
            
        }else{
            
            etotalAverageCalc = Float(elementarySchoolCorrect.sharedInstance.eCorrect) / Float(totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions)
            
            correctAverage.text = String("Total C/T: \(Float(etotalAverageCalc) * 100)%")
            
        }
        
        if(elementarySchoolWrong.sharedInstance.eWrongAnswers == 0 || totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions == 0){
            
            eincorrectAverage.text = "Total I/T: Sorry, Not Enough Data"
            
        }else{
            
            eincorrectAverageCalc = Float(elementarySchoolWrong.sharedInstance.eWrongAnswers) / Float(totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions)
            
            eincorrectAverage.text = String("Total I/T: \(Float(eincorrectAverageCalc) * 100)%")
            
        }
    
// Middle School Average
        
        if(middleCorrectQuestions.sharedInstance.midCorrectAnswer == 0 || middleTotalQuestions.sharedInstance.midTotalQuestions == 0){
            
            midCorrectAverage.text = "Total C/T: Sorry, Not Enough Data"
            
        }else{
            
            midCorrectAverage.text = String("Total C/T: \(Float(middleCorrectQuestions.sharedInstance.midCorrectAnswer) / Float(middleTotalQuestions.sharedInstance.midTotalQuestions) * 100)%")
            
        }
        
        if(middleIncorrectAnswers.sharedInstance.midIncorrectAnswers == 0 || middleTotalQuestions.sharedInstance.midTotalQuestions == 0){
            
            midIncorrectAverage.text = "Total I/T: Sorry, Not Enough Data"
            
        }else{
            
            midIncorrectAverage.text = String("Total I/T: \(Float(middleIncorrectAnswers.sharedInstance.midIncorrectAnswers) / Float(middleTotalQuestions.sharedInstance.midTotalQuestions) * 100)%")
            
        }
    
// High School Average
        
        if(highCorrectAnswers.sharedInstance.highCorrect == 0 || highSchoolTotalQuestions.sharedInstance.highQuestionsTotal == 0){
            
            highCorrectAverage.text = "Total C/T: Sorry, Not Enough Data"
            
        }else{
            
            highCorrectAverage.text = String("Total C/T: \(Float(highCorrectAnswers.sharedInstance.highCorrect) / Float(highSchoolTotalQuestions.sharedInstance.highQuestionsTotal) * 100)%")
            
        }
        
        if(highincorrectAnswers.sharedInstance.highIncorrect == 0 || highSchoolTotalQuestions.sharedInstance.highQuestionsTotal == 0){
            
            highIncorrectAverage.text = "Total I/T: Sorry, Not Enough Data"
            
        }else{
            
            highIncorrectAverage.text = String("Total I/T: \(Float(highincorrectAnswers.sharedInstance.highIncorrect) / Float(highSchoolTotalQuestions.sharedInstance.highQuestionsTotal) * 100)%")
            
        }
        
    }
    
    @IBAction func resetActivity(_ sender: Any) {
        
        areYouSure += 1
        
        if(areYouSure == 1){
            
            resetButtonText.setTitle("Are You Sure?", for: .normal)
            
        }else if(areYouSure >= 2){
            
            resetButtonText.setTitle("RESET", for: .normal)
            
            questionsGottenRight.SharedInstance.questionsGotten = 0
            questionsWrong.sharedInstances.questionsIncorrect = 0
            totalQuestions.sharedInstance.questionsAnswered = 0
            
            totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions = 0
            elementarySchoolCorrect.sharedInstance.eCorrect = 0
            elementarySchoolWrong.sharedInstance.eWrongAnswers = 0
            
            middleTotalQuestions.sharedInstance.midTotalQuestions = 0
            middleCorrectQuestions.sharedInstance.midCorrectAnswer = 0
            middleIncorrectAnswers.sharedInstance.midIncorrectAnswers = 0
            
            highSchoolTotalQuestions.sharedInstance.highQuestionsTotal = 0
            highCorrectAnswers.sharedInstance.highCorrect = 0
            highincorrectAnswers.sharedInstance.highIncorrect = 0
            
            UserDefaults.standard.set(totalQuestions.sharedInstance.questionsAnswered, forKey: "totalQuestions")
            UserDefaults.standard.set(questionsGottenRight.SharedInstance.questionsGotten, forKey: "questionsRight")
            UserDefaults.standard.set(questionsWrong.sharedInstances.questionsIncorrect, forKey: "answersWrong")
            
            UserDefaults.standard.set(totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions, forKey: "tElementary")
            UserDefaults.standard.set(elementarySchoolCorrect.sharedInstance.eCorrect, forKey: "eCorrect")
            UserDefaults.standard.set(elementarySchoolWrong.sharedInstance.eWrongAnswers, forKey: "eWrong")
            self.dismiss(animated: true, completion: nil)
            
            UserDefaults.standard.set(middleTotalQuestions.sharedInstance.midTotalQuestions, forKey: "midTotalQuestions")
            UserDefaults.standard.set(middleCorrectQuestions.sharedInstance.midCorrectAnswer, forKey: "midCorrectAnswers")
            UserDefaults.standard.set(middleIncorrectAnswers.sharedInstance.midIncorrectAnswers, forKey: "midIncorrectAnswers")
            
            UserDefaults.standard.set(highSchoolTotalQuestions.sharedInstance.highQuestionsTotal, forKey: "highTotalQuestions")
            UserDefaults.standard.set(highCorrectAnswers.sharedInstance.highCorrect, forKey: "highCorrectQuestions")
            UserDefaults.standard.set(highincorrectAnswers.sharedInstance.highIncorrect, forKey: "highIncorrectQuestions")
            
        }
        
    }
    
}
