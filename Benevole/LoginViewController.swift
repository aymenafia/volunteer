//
//  LoginViewController.swift
//  notreQuebec
//
//  Created by Mohamed aymen AFIA on 30/04/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import TweeTextField
class LoginViewController: UIViewController {

    @IBOutlet var txtemail: UITextField!
    
    @IBOutlet var txtpassword: UITextField!
    
    var Useruid : String?
    
    
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
