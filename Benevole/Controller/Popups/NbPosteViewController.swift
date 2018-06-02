//
//  NbPosteViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 02/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class NbPosteViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet var NbPostePickerView: UIPickerView!
    var numbers = [String]()
    var numberspostSelected : String = ""
    var numbersrowSelected : String = ""
    
    override func viewDidAppear(_ animated: Bool) {
        if let value = UserDefaults.standard.value(forKey: "nombrePosteRownumber") as? String , value != ""{
            
            NbPostePickerView.selectRow(Int(value)!, inComponent:0, animated:true)
        }else{
            
            print("")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 1...1000 {

        numbers.append(String(index))
        
        }
        NbPostePickerView.delegate = self
        NbPostePickerView.dataSource = self
    
        // Do any additional setup after loading the view.
    }

    @IBAction func saveNbposte(_ sender: Any) {
      
        dismiss(animated: true, completion: nil)
    }
    
    
    /////////
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
    return numbers.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return numbers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numbersrowSelected = String(row)
        numberspostSelected = numbers[row]
        print(numbers[row])
        UserDefaults.standard.set(numberspostSelected, forKey: "nombrePoste")
        UserDefaults.standard.set(numbersrowSelected, forKey: "nombrePosteRownumber")
    }
}
