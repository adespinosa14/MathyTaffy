//
//  integratedOneNavViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/9/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class integratedOneNavViewController: UIViewController {

    @IBOutlet var compositionOfFunctionsBG: UIImageView!
    @IBOutlet var FOILBackground: UIImageView!
    @IBOutlet var expressionsBackground: UIImageView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        UserDefaults.standard.set(highSchoolTotalQuestions.sharedInstance.highQuestionsTotal, forKey: "highTotalQuestions")
        UserDefaults.standard.set(highCorrectAnswers.sharedInstance.highCorrect, forKey: "highCorrectQuestions")
        UserDefaults.standard.set(highincorrectAnswers.sharedInstance.highIncorrect, forKey: "highIncorrectQuestions")
        
        UserDefaults.standard.set(totalQuestions.sharedInstance.questionsAnswered, forKey: "totalQuestions")
        UserDefaults.standard.set(questionsGottenRight.SharedInstance.questionsGotten, forKey: "totalQuestions")
        UserDefaults.standard.set(questionsWrong.sharedInstances.questionsIncorrect, forKey: "totalQuestions")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        compositionOfFunctionsBG.layer.cornerRadius = 7
        FOILBackground.layer.cornerRadius = 7
        expressionsBackground.layer.cornerRadius = 7
        
    }
    

}
