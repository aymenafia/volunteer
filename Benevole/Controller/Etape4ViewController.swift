//
//  Etape3ViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 18/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import RSSelectionMenu

class Etape4ViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {
    
    @IBOutlet var textViewNatureB: UITextView!
    @IBOutlet var textViewInstructionSp: UITextView!
    
    @IBOutlet var durée: UITextField!
    @IBOutlet var nombrePoste: UITextField!
    @IBOutlet var secteur: UITextField!
    @IBOutlet var langue: UITextField!
    @IBOutlet var cause: UITextField!
    
    
    var secteurvalue : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewNatureB.delegate = self
        textViewInstructionSp.delegate = self
        
        textViewNatureB.text = "Nature du Bénévolat"
        textViewNatureB.textColor = UIColor.lightGray
        
        textViewInstructionSp.text = "Instruction Spécifique"
        textViewInstructionSp.textColor = UIColor.lightGray
        
        secteur.delegate = self as! UITextFieldDelegate

        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textViewNatureB: UITextView) {
        if textViewNatureB.textColor == UIColor.lightGray {
            textViewNatureB.text = nil
            textViewNatureB.textColor = UIColor.black
        }
    }
    
    fileprivate func userDefaultCollect() {
        UserDefaults.standard.set(textViewNatureB.text!, forKey: "nature")
        UserDefaults.standard.set(textViewInstructionSp.text!, forKey: "instruction")
        UserDefaults.standard.set(durée.text!, forKey: "durée")
        UserDefaults.standard.set(nombrePoste.text!, forKey: "nombrePoste")
        UserDefaults.standard.set(secteur.text!, forKey: "secteur")
        UserDefaults.standard.set(langue.text!, forKey: "langue")
        UserDefaults.standard.set(cause.text!, forKey: "cause")
    }
    
   
    
  
    
    
    @IBAction func suivantButton(_ sender: Any) {

        
        
        
        print("countryPicker")
  
        
        
        
      userDefaultCollect()
        
 }
    
    func textViewDidEndEditing(_ textViewNatureB: UITextView) {
        
        
        if textViewNatureB.text.isEmpty {
            if textViewNatureB.tag == 0{
                textViewNatureB.text = "Nature du Bénévolat"
                textViewNatureB.textColor = UIColor.lightGray
                
            }

            if textViewNatureB.tag == 1{
                textViewNatureB.text = "Instruction Spécifique"
                textViewNatureB.textColor = UIColor.lightGray
                
            }
        }
    }
    
    
    
    
    
    
    
}
