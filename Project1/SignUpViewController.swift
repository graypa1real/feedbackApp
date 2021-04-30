//
//  SignUpViewController.swift
//  Project1
//
//  Created by admin on 4/22/21.
//

import UIKit
import CryptoKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var uName: UITextField!
    @IBOutlet weak var uPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUp(_ sender: Any) {
        if(DBHelper.inst.dataExist(query: uName.text!)){
            print("Username already exists")
        }
        else{
        
            let inputString = uPass.text! + uName.text! + "423"
            let inputData = Data(inputString.utf8)
            let hashed = SHA256.hash(data: inputData)
            print(hashed)
            let dic = ["username": uName.text, "password": String(describing: hashed)] as [String : Any]
            DBHelper.inst.addData(object: dic as! [String:String])
            
            //back to previous screen
            var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            var wel = sb.instantiateViewController(withIdentifier: "Entrance") as! ViewController
            present(wel, animated: true, completion: nil)
        
        
        
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
