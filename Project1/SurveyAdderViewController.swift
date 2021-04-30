//
//  SurveyAdderViewController.swift
//  Project1
//
//  Created by admin on 4/29/21.
//

import UIKit

class SurveyAdderViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var q1: UITextField!
    @IBOutlet weak var q2: UITextField!
    @IBOutlet weak var q3: UITextField!
    @IBOutlet weak var q4: UITextField!
    @IBOutlet weak var q5: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addSurvey(_ sender: Any) {
        if(DBHelper.inst.dataExist(query: name.text!)){
            print("Username already exists")
        }
        else{
        

            let dic = ["name": name.text, "q1": q1.text, "q2": q2.text, "q3": q3.text, "q4": q4.text, "q5": q5.text]
            DBHelper.inst.addSurvey(object: dic as! [String:String])
            
            //back to previous screen
  
        
        }
    }


}
