//
//  InstructionspViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 02/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class InstructionspViewController: UIViewController {

    @IBOutlet var instructionTV: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value =  UserDefaults.standard.value(forKey: "instruction") as? String{
            
            
            instructionTV.text = value
            
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func SaveInstructionsp(_ sender: Any) {
         UserDefaults.standard.set(instructionTV.text!, forKey: "instruction")
        dismiss(animated: true, completion: nil)
        
        
    }
    
}
