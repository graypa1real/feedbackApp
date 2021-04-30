//
//  LoginViewController.swift
//  Project1
//
//  Created by admin on 4/22/21.
//

import UIKit
import CryptoKit

class LoginViewController: UIViewController {
    let ud = UserDefaults.standard
    
    @IBOutlet weak var uName: UITextField!
    @IBOutlet weak var uPass: UITextField!
    @IBOutlet weak var remSwitch: UISwitch!
    override func viewDidLoad() {
        if ud.bool(forKey: "rem"){
            uName.text = ud.string(forKey: "uName")
            uPass.text = ud.string(forKey: "uPass")
            remSwitch.isOn = true
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func remSwitchPressed(_ sender: Any) {
        if(remSwitch.isOn){
            
            ud.setValue(uName.text, forKey: "uName")
            ud.setValue(true, forKey: "rem")
            ud.setValue(uPass.text, forKey: "uPass")
            
        }
        else{
            ud.removeObject(forKey: "uName")
            ud.removeObject(forKey: "uPass")
            ud.setValue(false, forKey: "rem")
        }
    }
    
    @IBAction func login(_ sender: Any) {
        let inputString = uPass.text! + uName.text! + "423"
        
        let inputData = Data(inputString.utf8)
        let hashed = SHA256.hash(data: inputData)
        print(hashed)
       
        if(DBHelper.inst.dataExist(query: uName.text!)){
            
            if(DBHelper.inst.validatePass(uName: uName.text!, uPass: String(describing: hashed))){
                
                print("username and password matched")
                ud.setValue(uName.text, forKey: "currUser")
                var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                var wel = sb.instantiateViewController(withIdentifier: "LoggedIn") as! ReviewLauncherViewController
                present(wel, animated: true, completion: nil)
            }
            else{print("incorrect password")}
        } else {
            print("Username does not Exist")
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
