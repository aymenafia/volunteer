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

        // Do any additional setup after loading the view.
    }


    @IBAction func saveNature(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
}
