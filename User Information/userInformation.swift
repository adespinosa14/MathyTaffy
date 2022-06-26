//
//  userInformation.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/23/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import Foundation

class person{
    
    var name = String()
    var grade = String()
    
    class var sharedInstance: person{
        struct singleton{
         static let instance = person()
        }
        return singleton.instance
    }
    
    init() {
        
        if ((UserDefaults.standard.object(forKey: "names") as? String) != nil) && UserDefaults.standard.object(forKey: "grades") as? String != nil {
            
            name = (UserDefaults.standard.object(forKey: "names") as? String)!
            grade = (UserDefaults.standard.object(forKey: "grades") as? String)!
            
        }else{
            
            name = "nil"
            grade = "nil"
            
        }
        
    }
    
}
