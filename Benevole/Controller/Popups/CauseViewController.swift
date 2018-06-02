//
//  CauseViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 02/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class CauseViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet var CausePickerView: UIPickerView!
    var causes = ["Aînés","Jeunesse","Personnes malades ou handicapées","Personnes démunies","Familles","Femmes","Réfugiés et immigrants","Autres"]
    override func viewDidLoad() {
        super.viewDidLoad()
        CausePickerView.delegate = self
        CausePickerView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func saveCause(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /////////
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        
        return causes.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        return causes[row]
    }
    var causeSlected : String = ""
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        causeSlected = causes[row]
        print(causes[row])
        
    }
}
