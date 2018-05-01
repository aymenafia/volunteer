//
//  ViewController.swift
//  notreQuebec
//
//  Created by Mohamed aymen AFIA on 30/04/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    @IBOutlet var b2: UIButton!
    
    @IBOutlet var b1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
  
        b1.layer.cornerRadius = 7
        b1.layer.borderWidth = 1
        b1.layer.borderColor = UIColor.white.cgColor
        
        b2.layer.cornerRadius = 7
        b2.layer.borderWidth = 1
        b2.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view, typically from a nib.
    }

}

