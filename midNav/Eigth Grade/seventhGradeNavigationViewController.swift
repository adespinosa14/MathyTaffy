//
//  seventhGradeNavigationViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 7/6/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class seventhGradeNavigationViewController: UIViewController {

    @IBOutlet var algebraBackground: UIImageView!
    @IBOutlet var ratiosBackground: UIImageView!
    @IBOutlet var rationalNumbersBackground: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        UserDefaults.standard.set(middleTotalQuestions.sharedInstance.midTotalQuestions, forKey: "midTotalQuestions")
        UserDefaults.standard.set(middleCorrectQuestions.sharedInstance.midCorrectAnswer, forKey: "midCorrectAnswers")
        UserDefaults.standard.set(middleIncorrectAnswers.sharedInstance.midIncorrectAnswers, forKey: "midIncorrectAnswers")
        UserDefaults.standard.set(purchasable.sharedInstance.taffyBucks, forKey: "taffyCurrency")
        
        UserDefaults.standard.set(totalQuestions.sharedInstance.questionsAnswered, forKey: "totalQuestions")
        UserDefaults.standard.set(questionsGottenRight.SharedInstance.questionsGotten, forKey: "totalQuestions")
        UserDefaults.standard.set(questionsWrong.sharedInstances.questionsIncorrect, forKey: "totalQuestions")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        algebraBackground.layer.cornerRadius = 7
        ratiosBackground.layer.cornerRadius = 7
        rationalNumbersBackground.layer.cornerRadius = 7
        
    }
    

}
