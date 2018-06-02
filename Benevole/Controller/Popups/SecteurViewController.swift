//
//  SecteurViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 02/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class SecteurViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
 

    var seteurs = ["Bénévolat de groupes","Loisirs","Sport","Éducation","Santé et services sociaux","Environnement","Arts et Culture","Économie sociale","Habitation / Hébergement","Sécurité alimentaire","Action bénévole","Sécurité civile","Coopération internationale","Défenses des droits"]
    
    
    @IBOutlet var secteurPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        secteurPickerView.delegate = self
        secteurPickerView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func saveSecteur(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /////////
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        
        return seteurs.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        return seteurs[row]
    }
    var seteursSlected : String = ""
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        seteursSlected = seteurs[row]
        print(seteurs[row])
        
    }
}
