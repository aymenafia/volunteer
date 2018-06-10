//
//  DescPopUp.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 09/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class DescPopUpVC: UIViewController {

    @IBOutlet var descriptionTV: UITextView!
    @IBOutlet var labelTitle: UILabel!
    
    var titleValue: String?
    var descriptionValue: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
labelTitle.text = titleValue!
        descriptionTV.text = descriptionValue!
        // Do any additional setup after loading the view.
    }

    @IBAction func dismissButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)

    }


}
