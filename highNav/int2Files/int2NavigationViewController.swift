//
//  int2NavigationViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/10/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class int2NavigationViewController: UIViewController {

    
    @IBOutlet var compositionOfFunctionsBackground: UIImageView!
    @IBOutlet var expandingPolynomialsBackground: UIImageView!
    @IBOutlet var factoringAOneBackground: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        UserDefaults.standard.set(highSchoolTotalQuestions.sharedInstance.highQuestionsTotal, forKey: "highTotalQuestions")
        UserDefaults.standard.set(highCorrectAnswers.sharedInstance.highCorrect, forKey: "highCorrectQuestions")
        UserDefaults.standard.set(highincorrectAnswers.sharedInstance.highIncorrect, forKey: "highIncorrectQuestions")
        
        UserDefaults.standard.set(totalQuestions.sharedInstance.questionsAnswered, forKey: "totalQuestions")
        UserDefaults.standard.set(questionsGottenRight.SharedInstance.questionsGotten, forKey: "totalQuestions")
        UserDefaults.standard.set(questionsWrong.sharedInstances.questionsIncorrect, forKey: "totalQuestions")
    }
    
    @IBOutlet var compBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        compBackground.layer.cornerRadius = 7
        expandingPolynomialsBackground.layer.cornerRadius = 7
        factoringAOneBackground.layer.cornerRadius = 7

    }

}
