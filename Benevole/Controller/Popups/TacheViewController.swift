//
//  TâcheViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 01/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class TacheViewController: UIViewController {

    @IBOutlet var tacheTV: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value =  UserDefaults.standard.value(forKey: "tache") as? String{
            
            
            tacheTV.text = value
            
        }
        // Do any additional setup after loading the view.
    }

   
    
    @IBAction func saveTache(_ sender: Any) {
        UserDefaults.standard.set(tacheTV.text!, forKey: "tache")

        dismiss(animated: true, completion: nil)
        
        
    }
}
