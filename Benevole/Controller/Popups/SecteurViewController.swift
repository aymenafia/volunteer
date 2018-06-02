//
//  SecteurViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 02/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class SecteurViewController: UIViewController {

    @IBOutlet var nbPostePickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveSecteur(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
