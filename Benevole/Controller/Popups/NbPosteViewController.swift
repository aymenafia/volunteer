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
    var numberspostSelected : String = ""
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        numberspostSelected = numbers[row]
        print(numbers[row])
        
    }
}
