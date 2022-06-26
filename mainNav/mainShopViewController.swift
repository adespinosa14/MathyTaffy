//
//  mainShopViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/18/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class mainShopViewController: UIViewController {

    @IBOutlet var taffyBucksLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserDefaults.standard.set(purchasable.sharedInstance.taffyBucks, forKey: "taffyCurrency")
        taffyBucksLabel.text = String("Taffy Bucks: \(purchasable.sharedInstance.taffyBucks)")
        
    }


}
