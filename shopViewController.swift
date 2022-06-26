//
//  shopViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 1/6/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit
import VideoSubscriberAccount

class shopViewController: UIViewController {
    
    
    @IBOutlet var mathySoarsPurchasable: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        UserDefaults.standard.set(purchasable.sharedInstance.mathyBucks, forKey: "mathyCurrency")
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
