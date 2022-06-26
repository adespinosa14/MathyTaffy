//
//  navigationHomeViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 7/23/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class navigationHomeViewController: UIViewController {
    
    @IBOutlet var tutoringButton: UIButton!
    let local = Locale.current
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(local)
        print(local.regionCode!)
        
        if local.regionCode != String("US"){
            
            print("Well Hello Sir")
            tutoringButton.isHidden = true
            
        }
        
        // Do any additional setup after loading the view.
    }
    

}
