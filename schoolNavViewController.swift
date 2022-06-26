//
//  schoolNavViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 1/23/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class schoolNavViewController: UIViewController {

    @IBOutlet var eleImage: UIImageView!
    @IBOutlet var midImage: UIImageView!
    @IBOutlet var highImage: UIImageView!
    @IBAction func schoolNavv(_sender: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eleImage.layer.cornerRadius = 6
        midImage.layer.cornerRadius = 6
        highImage.layer.cornerRadius = 6
        
    }

}
