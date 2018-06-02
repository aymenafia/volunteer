//
//  NaturebViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 02/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class NaturebViewController: UIViewController {

    @IBOutlet var natureTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value =  UserDefaults.standard.value(forKey: "nature") as? String{
            
            
            natureTF.text = value
            
        }
        // Do any additional setup after loading the view.
    }


    @IBAction func saveNature(_ sender: Any) {
        UserDefaults.standard.set(natureTF.text!, forKey: "nature")
        dismiss(animated: true, completion: nil)
        
        
    }
    
}
