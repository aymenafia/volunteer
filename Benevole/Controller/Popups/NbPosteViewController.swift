//
//  NbPosteViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 02/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class NbPosteViewController: UIViewController {

    @IBOutlet var causePickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveNbposte(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
