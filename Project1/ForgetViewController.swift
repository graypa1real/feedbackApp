//
//  ForgetViewController.swift
//  Project1
//
//  Created by admin on 4/26/21.
//

import UIKit
import CryptoKit

class ForgetViewController: UIViewController {

    @IBOutlet weak var upass: UITextField!
    @IBOutlet weak var uname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func updatePass(_ sender: Any) {
        let inputString = upass.text! + uname.text! + "423"
        
        let inputData = Data(inputString.utf8)
        let hashed = SHA256.hash(data: inputData)
        print(hashed)
       
        if(DBHelper.inst.dataExist(query: uname.text!)){
            
            DBHelper.inst.updateData(uName: uname.text!, uPass: String(describing: hashed))
                
                
                var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                var wel = sb.instantiateViewController(withIdentifier: "LoginPage") as! LoginViewController
                present(wel, animated: true, completion: nil)
            
        } else {
            print("Username does not Exist")
        }
    }

}
