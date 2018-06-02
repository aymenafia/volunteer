//
//  DureeViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 02/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class DureeViewController: UIViewController {

    @IBOutlet var dureeTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value =  UserDefaults.standard.value(forKey: "durée") as? String{
            
            
            dureeTF.text = value
            
        }
        // Do any additional setup after loading the view.
    }


    @IBAction func saveDuree(_ sender: Any) {
         UserDefaults.standard.set(dureeTF.text!, forKey: "durée")
        dismiss(animated: true, completion: nil)
    }
    
}
