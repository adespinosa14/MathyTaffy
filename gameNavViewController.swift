//
//  gameNavViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/15/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class gameNavViewController: UIViewController {

    @IBOutlet var mathySoarsBackground: UIImageView!
    @IBOutlet var mathySoarsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mathySoarsBackground.layer.cornerRadius = 7
        
    }
    
}
