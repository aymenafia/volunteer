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
    var causeSlected : String = ""
    var causerowSlected : String = ""
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CausePickerView.delegate = self
        CausePickerView.dataSource = self
        
        if let value = UserDefaults.standard.value(forKey: "causerowSlected") as? String , value != ""{
            
            CausePickerView.selectRow(Int(value)!, inComponent:0, animated:true)
        }else{
            
 CausePickerView.selectRow(1, inComponent:0, animated:true)        }
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        causerowSlected = String(row)
        causeSlected = causes[row]
        print(causes[row])
        UserDefaults.standard.set(causeSlected, forKey: "cause")
        UserDefaults.standard.set(causerowSlected, forKey: "causerowSlected")
    }
}
