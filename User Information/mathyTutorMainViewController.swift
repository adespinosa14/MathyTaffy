//
//  mathyTutorMainViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 7/10/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class mathyTutorMainViewController: UIViewController {

    
    @IBOutlet var studentName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studentName.text = String("Feeling Stuck \(person.sharedInstance.name)?")
        
        // Do any additional setup after loading the view.
    }
    

}
