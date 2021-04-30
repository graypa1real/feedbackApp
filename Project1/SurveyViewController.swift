//
//  SurveyViewController.swift
//  Project1
//
//  Created by admin on 4/29/21.
//

import UIKit

class SurveyViewController: UIViewController {
    let ud = UserDefaults.standard
    
    @IBOutlet weak var nameL: UILabel!
    
    @IBOutlet weak var q1L: UILabel!
    @IBOutlet weak var q1A: CosmosView!
    
    @IBOutlet weak var q2L: UILabel!
    @IBOutlet weak var q2A: CosmosView!
    
    @IBOutlet weak var q3L: UILabel!
    @IBOutlet weak var q3A: CosmosView!
    
    @IBOutlet weak var q4L: UILabel!
    @IBOutlet weak var q4A: CosmosView!
    
    @IBOutlet weak var q5L: UILabel!
    @IBOutlet weak var q5A: CosmosView!
    var surName : String = ""
    var currUser : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        currUser = ud.string(forKey: "currUser")!
        surName = ud.string(forKey: "currSur")!
       
    
       
        if(DBHelper.inst.surveyExist(query: surName)){
            print("inside")
            nameL.text = ud.string(forKey: "currSur")
            var surveyHolder = DBHelper.inst.fetchSurvey(query : surName)
            q1L.text = surveyHolder["q1"]
            q2L.text = surveyHolder["q2"]
            q3L.text = surveyHolder["q3"]
            q4L.text = surveyHolder["q4"]
            q5L.text = surveyHolder["q5"]
    
            
        }
            
    }
    
    @IBAction func submitSurv(_ sender: Any) {
        DBHelper.inst.addCompletion(user : currUser, surN : surName)
    }


}
