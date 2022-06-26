//
//  eigthGradeNavigationViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 7/6/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class eigthGradeNavigationViewController: UIViewController {

    
    @IBOutlet var linearEquationBackground: UIImageView!
    @IBOutlet var pythagoreanTheoremBackground: UIImageView!
    @IBOutlet var exponentRulesBackground: UIImageView!
    @IBOutlet var exponentRulesButton: UIButton!
    
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
        
        linearEquationBackground.layer.cornerRadius = 7
        pythagoreanTheoremBackground.layer.cornerRadius = 7
        exponentRulesBackground.isHidden = true
        exponentRulesBackground.layer.cornerRadius = 7
        
        exponentRulesButton.isHidden = true
        exponentRulesButton.layer.cornerRadius = 7
        
        // Do any additional setup after loading the view.
    }

}
