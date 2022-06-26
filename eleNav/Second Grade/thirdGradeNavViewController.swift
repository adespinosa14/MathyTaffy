//
//  thirdGradeNavViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/22/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class thirdGradeNavViewController: UIViewController {

    
    @IBOutlet var roundingBackground: UIImageView!
    @IBOutlet var multiplicationBackground: UIImageView!
    @IBOutlet var divisionBackground: UIImageView!
    
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

        roundingBackground.layer.cornerRadius = 7
        multiplicationBackground.layer.cornerRadius = 7
        divisionBackground.layer.cornerRadius = 7
        
        
    }
    

}
