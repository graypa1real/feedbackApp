//
//  ReviewLauncherViewController.swift
//  Project1
//
//  Created by admin on 4/29/21.
//

import UIKit

class ReviewLauncherViewController: UIViewController {
    let ud = UserDefaults.standard
    var currUser: String = ""
    var surName : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        ud.setValue("food", forKey: "currSur")
        currUser =  ud.string(forKey: "currUser")!
        surName = "food"
        // Do any additional setup after loading the view.
    }
    @IBAction func sendToSurvey(_ sender: Any) {
        if(DBHelper.inst.surComp(user : currUser, surv : surName)){
            var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            var wel = sb.instantiateViewController(withIdentifier: "AlreadyDone") as! SurveyViewController
            present(wel, animated: true, completion: nil)
        }
        else{
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var wel = sb.instantiateViewController(withIdentifier: "Survey") as! SurveyViewController
        present(wel, animated: true, completion: nil)
        }
    }
    
    @IBAction func Food(_ sender: Any) {
        ud.setValue("food", forKey: "currSur")
        surName = "food"
    }
    
    @IBAction func sercice(_ sender: Any) {
        ud.setValue("staff", forKey: "currSur")
        surName = "staff"
    }
    @IBAction func logout(_ sender: Any) {
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var wel = sb.instantiateViewController(withIdentifier: "Entrance") as! ViewController
        present(wel, animated: true, completion: nil)
    }

}
