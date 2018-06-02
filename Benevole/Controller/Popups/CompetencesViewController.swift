//
//  CompétencesViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 02/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class CompetencesViewController: UIViewController {

    @IBOutlet var competenceTV: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value =  UserDefaults.standard.value(forKey: "competence") as? String{
            
            
            competenceTV.text = value
            
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func saveCompetence(_ sender: Any) {
        UserDefaults.standard.set(competenceTV.text!, forKey: "competence")

    dismiss(animated: true, completion: nil)
    
    }
    
}
