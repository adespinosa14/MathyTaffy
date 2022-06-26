//
//  submitInformationViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 6/23/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class submitInformationViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var enterNameInput: UITextField!
    @IBOutlet var enterGradeInput: UITextField!
    @IBOutlet var errorMessage: UILabel!
    
    @IBAction func submitInformation(_ sender: Any) {
        
        if(enterNameInput.text == String("") && enterGradeInput.text == String("")){
         
            errorMessage.text = "Please Fill Out The Form"
            errorMessage.isHidden = false
            
        }else if(enterNameInput.text == String("")){
            
            errorMessage.text = "Please Enter Your Name"
            errorMessage.isHidden = false
            
        }else if(enterGradeInput.text == String("")){
            
            errorMessage.text = "Please Enter Your Grade"
            errorMessage.isHidden = false
            
        }else if(Int(enterGradeInput.text!)! > 12){
            
            errorMessage.text = "Please Enter A Number Lower Than 13"
            errorMessage.isHidden = false
            
        }else if(Int(enterGradeInput.text!)! <= 0){
            
            errorMessage.text = "Please Enter A Number Higher Than 0"
            errorMessage.isHidden = false
            
        }else{
            
            person.sharedInstance.name = enterNameInput.text!
            person.sharedInstance.grade = enterGradeInput.text!
            performSegue(withIdentifier: "mainView", sender: nil)
            
        }
        
        
    }
    
    func tooManyLetters(){
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        enterNameInput.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if(person.sharedInstance.name != String("nil") && person.sharedInstance.grade != String("nil")){
                 
                 enterNameInput.text = person.sharedInstance.name
                 enterGradeInput.text = person.sharedInstance.grade
                 
             }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        errorMessage.isHidden = true
        
    }

}
