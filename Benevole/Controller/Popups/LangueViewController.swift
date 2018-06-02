//
//  LangueViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 02/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class LangueViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
var langues = ["Français","Anglais"]
    @IBOutlet var LanguePickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        LanguePickerView.delegate = self
        LanguePickerView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func saveLangue(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /////////
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        
        return langues.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        return langues[row]
    }
    var langueSlected : String = ""
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        langueSlected = langues[row]
        print(langues[row])
        
    }
}
