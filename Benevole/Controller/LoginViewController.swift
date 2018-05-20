//
//  LoginViewController.swift
//  notreQuebec
//
//  Created by Mohamed aymen AFIA on 30/04/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import TweeTextField
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet var txtemail: UITextField!
    
    @IBOutlet var txtpassword: UITextField!
    
    var Useruid : String?
    
    @IBAction func testNav(_ sender: Any) {
        
        let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nav = mainStoryboardIpad.instantiateViewController(withIdentifier: "MainNavController") as! UINavigationController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = nav
    }
    
    @IBAction func signIn(_ sender: Any) {
        
        
        print("toped in")
        Auth.auth().signIn(withEmail: txtemail.text!, password: txtpassword.text!) { (user, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
            }else{
                
                self.Useruid = (user?.uid)!
                print((user?.uid)!)
                print("login")
                let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nav = mainStoryboardIpad.instantiateViewController(withIdentifier: "MainNavController") as! UINavigationController
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = nav
                //self.GoToPosting()
            }
            
        }
        
    }
    
    @IBOutlet var identifier: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        identifier.layer.cornerRadius = 7
        identifier.layer.borderWidth = 1
        identifier.layer.borderColor = UIColor.white.cgColor
       // txtemail.infoTextColor = .yellow
        //txtemail.showInfo("Hello World!", animated: true)
        // Do any additional setup after loading the view.
    }

  
}
