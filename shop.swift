//
//  shop.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/18/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import Foundation



class purchasable{
    
    var taffyBucks = 0
    
    class var sharedInstance: purchasable{
        struct singleton{
            static let instance = purchasable()
        }
        
        return singleton.instance
    }
    
    init(){
        
        switch UserDefaults.standard.object(forKey: "taffyCurrency") == nil {
        case true:
            print("There are no stored coins")
            taffyBucks = 0
        default:
            taffyBucks = UserDefaults.standard.object(forKey: "taffyCurrency") as! Int
        }
        
    }
    
}

class orderForm{
    
    var orderNumber = 0
    
    class var sharedInstance: orderForm{
        struct singleton{
            static let instance = orderForm()
        }
        
        return singleton.instance
    }
    
    init(){
        
        switch UserDefaults.standard.object(forKey: "orderFormNumber") == nil{
            
        case true:
            print("User Has Not Had A Tutoring Session")
            orderNumber = 0
            break
        default:
                
            orderNumber = UserDefaults.standard.object(forKey: "orderFormNumber") as! Int
        }
        
    }
    
}
