//
//  ViewController.swift
//  MathStar
//
//  Created by Andrew Espinosa on 1/5/20.
//  Copyright © 2020 Andrew Espinosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationBarDelegate, UIScrollViewDelegate{
    
    @IBOutlet var ClaudineView: UIView!
    @IBOutlet var scroll: UIScrollView!
    @IBOutlet var welcomeBackLabel: UILabel!
    
    // School Information
    @IBOutlet var schoolTitle: UILabel!
    @IBOutlet var totalCorrect: UILabel!
    @IBOutlet var totalIncorrect: UILabel!
    @IBOutlet var firstQuickLink: UIButton!
    @IBOutlet var secondQuickLink: UIButton!
    
    
    @IBAction func unwravel(_ sender: UIStoryboardSegue){}
    @IBAction func unwravelAnalytics (_ sender: UIStoryboardSegue){}

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //Total Analytics
        ClaudineView.setGradientBackground(colorOne: color.blue, colorTwo: color.lightBlue)
        scroll.setGradientBackground(colorOne: color.blue, colorTwo: color.lightBlue)
                
    }

    override func viewDidAppear(_ animated: Bool) {
        
        UserDefaults.standard.set(totalQuestions.sharedInstance.questionsAnswered, forKey: "totalQuestions")
        UserDefaults.standard.set(questionsGottenRight.SharedInstance.questionsGotten, forKey: "questionsRight")
        UserDefaults.standard.set(questionsWrong.sharedInstances.questionsIncorrect, forKey: "answersWrong")
        
        //Elementary School Analytics
        UserDefaults.standard.set(totalElementarySchoolAnalytics.sharedInstance.tElementaryQuestions, forKey: "tElementary")
        UserDefaults.standard.set(elementarySchoolCorrect.sharedInstance.eCorrect, forKey: "eCorrect")
        UserDefaults.standard.set(elementarySchoolWrong.sharedInstance.eWrongAnswers, forKey: "eWrong")
        
        //Middle School
        
        UserDefaults.standard.set(middleTotalQuestions.sharedInstance.midTotalQuestions, forKey: "midTotalQuestions")
        UserDefaults.standard.set(middleCorrectQuestions.sharedInstance.midCorrectAnswer, forKey: "midCorrectAnswers")
        UserDefaults.standard.set(middleIncorrectAnswers.sharedInstance.midIncorrectAnswers, forKey: "midIncorrectAnswers")
        
        //High School
        
        UserDefaults.standard.set(highSchoolTotalQuestions.sharedInstance.highQuestionsTotal, forKey: "highTotalQuestions")
        UserDefaults.standard.set(highCorrectAnswers.sharedInstance.highCorrect, forKey: "highCorrectQuestions")
        UserDefaults.standard.set(highincorrectAnswers.sharedInstance.highIncorrect, forKey: "highIncorrectQuestions")
        
        //Store
        print(person.sharedInstance.name)
        print(person.sharedInstance.grade)
        
        //Person Stats
        UserDefaults.standard.set(person.sharedInstance.name, forKey: "names")
        UserDefaults.standard.set(person.sharedInstance.grade, forKey: "grades")
        
        //Home Information
        welcomeBackLabel.text = String("Welcome \(person.sharedInstance.name)!")
        
        if(Int(person.sharedInstance.grade)! <= 5){
            
            schoolTitle.text = "Elementary School"
            totalCorrect.text = "Total Correct: \(elementarySchoolCorrect.sharedInstance.eCorrect)"
            totalIncorrect.text = "Total Incorrect: \(elementarySchoolWrong.sharedInstance.eWrongAnswers)"
            firstQuickLink.setTitle("Elementary School", for: .normal)
            
        }else if(Int(person.sharedInstance.grade)! <= 8){
            
            schoolTitle.text = "Middle School"
            totalCorrect.text = String("Total Correct: \(middleCorrectQuestions.sharedInstance.midCorrectAnswer)")
            totalIncorrect.text = String("Total Incorrect: \(middleIncorrectAnswers.sharedInstance.midIncorrectAnswers)")
            firstQuickLink.setTitle("Middle School", for: .normal)
            
        }else if(Int(person.sharedInstance.grade)! <= 12){
            
            schoolTitle.text = "High School"
            totalCorrect.text = "Total Correct: \(highCorrectAnswers.sharedInstance.highCorrect)"
            totalIncorrect.text = "Total Incorrect: \(highincorrectAnswers.sharedInstance.highIncorrect)"
            firstQuickLink.setTitle("High School", for: .normal)
            
        }
        
        UserDefaults.standard.set(orderForm.sharedInstance.orderNumber, forKey: "orderFormNumber")
        
        switch Int(person.sharedInstance.grade)! {
        case 1:
            secondQuickLink.setTitle("First Grade", for: .normal)
            break
        case 2:
            secondQuickLink.setTitle("Second Grade", for: .normal)
            break
        case 3:
            secondQuickLink.setTitle("Third Grade", for: .normal)
            break
        case 4:
            secondQuickLink.setTitle("Fourth Grade", for: .normal)
            break
        case 5:
            secondQuickLink.setTitle("Fifth Grade", for: .normal)
            break
        case 6:
            secondQuickLink.setTitle("Sixth Grade", for: .normal)
            break
        case 7:
            secondQuickLink.setTitle("Seventh Grade", for: .normal)
            break
        case 8:
            secondQuickLink.setTitle("Eigth Grade", for: .normal)
            break
        case 9:
            secondQuickLink.setTitle("Freshman Year", for: .normal)
            break
        case 10:
            secondQuickLink.setTitle("Sophomore Year", for: .normal)
            break
        case 11:
            secondQuickLink.setTitle("Junior Year", for: .normal)
            break
        case 12:
            secondQuickLink.setTitle("Senior Year", for: .normal)
        default:
            print("This Code Should Not Run")
        }
        
        
    }
    
    @IBAction func firstLinkPressed(_ sender: Any) {
        
    if(Int(person.sharedInstance.grade)! <= 5){
        
        performSegue(withIdentifier: "elementarySchool", sender: nil)
                   
        }else if(Int(person.sharedInstance.grade)! <= 8){
        
        performSegue(withIdentifier: "middleSchool", sender: nil)
        
        }else if(Int(person.sharedInstance.grade)! <= 12){
                
            performSegue(withIdentifier: "highSchool", sender: nil)
        }
        
    }
    
    
    @IBAction func secondLinkPressed(_ sender: Any) {
        
        switch Int(person.sharedInstance.grade)! {
        case 1:
            performSegue(withIdentifier: "firstGrade", sender: nil)
            break
        case 2:
            performSegue(withIdentifier: "secondGrade", sender: nil)
            break
        case 3:
            performSegue(withIdentifier: "thirdGrade", sender: nil)
            break
        case 4:
            performSegue(withIdentifier: "fourthGrade", sender: nil)
            break
        case 5:
            performSegue(withIdentifier: "fifthGrade", sender: nil)
            break
        case 6:
            performSegue(withIdentifier: "sixthGrade", sender: nil)
            break
        case 7:
            performSegue(withIdentifier: "seventhGrade", sender: nil)
            break
        case 8:
            performSegue(withIdentifier: "eigthGrade", sender: nil)
            break
        case 9:
            performSegue(withIdentifier: "ninthGrade", sender: nil)
            break
        case 10:
            performSegue(withIdentifier: "tenthGrade", sender: nil)
            break
        case 11:
            performSegue(withIdentifier: "eleventhGrade", sender: nil)
            break
        case 12:
           performSegue(withIdentifier: "eleventhGrade", sender: nil)
        default:
            print("This Code Should Not Run")
        }
        
    }
    
    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }
    
    @IBAction func instaPressed(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "https://www.instagram.com/mathytaffyofficial/")!, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func twitterPressed(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "https://twitter.com/mathy_taffy")!, options: [:], completionHandler: nil)
        
    }
    
    
    @IBAction func facebookButton(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "https://www.facebook.com/mathytaffy")!, options:[:], completionHandler: nil)
        
    }
    
}
