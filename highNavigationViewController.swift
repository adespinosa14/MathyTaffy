//
//  highNavigationViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/7/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class highNavigationViewController: UIViewController {

    @IBOutlet var compositionOfFunctionsButton: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        UserDefaults.standard.set(highSchoolTotalQuestions.sharedInstance.highQuestionsTotal, forKey: "highTotalQuestions")
        UserDefaults.standard.set(highCorrectAnswers.sharedInstance.highCorrect, forKey: "highCorrectQuestions")
        UserDefaults.standard.set(highincorrectAnswers.sharedInstance.highIncorrect, forKey: "highIncorrectQuestions")
        
        UserDefaults.standard.set(purchasable.sharedInstance.taffyBucks, forKey: "taffyCurrency")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        compositionOfFunctionsButton.layer.cornerRadius = 7
    }
    


}
