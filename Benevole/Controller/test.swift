//
//  test.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 19/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class test: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {


    @IBOutlet var saveButton: UIButton!
    @IBOutlet var pickerview1: UIPickerView!
    @IBOutlet var secteurLbl: UILabel!
    
    var pickerViewState : String?
    
    let countries = ["germany","France","Canada","Tunisie","Norway","Netherland"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        pickerview1.delegate = self
        pickerview1.dataSource = self
        
        
        
        print(pickerViewState!)
        // Do any additional setup after loading the view.
    }

    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     
        
        
       return countries.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        print(countries[row])
        
    }

    @IBAction func save(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
   }
    
}
