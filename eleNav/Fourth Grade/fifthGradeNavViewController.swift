//
//  fifthGradeNavViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/22/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class fifthGradeNavViewController: UIViewController {

    
    @IBOutlet var expressionsBackground: UIImageView!
    @IBOutlet var subtractionBackground: UIImageView!
    @IBOutlet var multiplicationFluency: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Total Analytics
               UserDefaults.standard.set(totalQuestions.sharedInstance.questionsAnswered, forKey: "totalQuestions")
               UserDefaults.standard.set(questionsGottenRight.SharedInstance.questionsGotten, forKey: "totalQuestions")
               UserDefaults.standard.set(questionsWrong.sharedInstances.questionsIncorrect, forKey: "totalQuestions")
               
               //Elementary School Analytics
               UserDefaults.standard.set(totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions, forKey: "tElementary")
               UserDefaults.standard.set(elementarySchoolCorrect.sharedInstance.eCorrect, forKey: "eCorrect")
               UserDefaults.standard.set(elementarySchoolWrong.sharedInstance.eWrongAnswers, forKey: "eWrong")
               
               // Store
               UserDefaults.standard.set(purchasable.sharedInstance.taffyBucks, forKey: "taffyCurrency")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        expressionsBackground.layer.cornerRadius = 7
        subtractionBackground.layer.cornerRadius = 7
        multiplicationFluency.layer.cornerRadius = 7
        
        
    }
    
}
