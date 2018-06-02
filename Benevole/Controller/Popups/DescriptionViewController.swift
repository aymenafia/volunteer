//
//  DescriptionViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 01/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet var descriptionTV: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value =  UserDefaults.standard.value(forKey: "description") as? String{
            
            
         descriptionTV.text = value
            
        }


        // Do any additional setup after loading the view.
    }

    @IBAction func save(_ sender: Any) {
        UserDefaults.standard.set(descriptionTV.text!, forKey: "description")

        self.dismiss(animated: true, completion: nil)
        
    }
    

}
