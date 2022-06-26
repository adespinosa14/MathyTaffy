//
//  mainWelcomeViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/24/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class mainWelcomeViewController: UIViewController {

    
    override func viewDidAppear(_ animated: Bool) {
        
        if(person.sharedInstance.name == String("nil") && person.sharedInstance.grade == String("nil")){
                  
                  print("Do Nothing")
                  
              }else{
                  
                  performSegue(withIdentifier: "haveAccount", sender: nil)
                  
              }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
