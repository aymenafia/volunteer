//
//  Etape3ViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 18/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class Etape4ViewController: UIViewController,UITextViewDelegate {
    
    @IBOutlet var textViewNatureB: UITextView!
    @IBOutlet var textViewInstructionSp: UITextView!
    
    @IBOutlet var durée: UITextField!
    @IBOutlet var nombrePoste: UITextField!
    @IBOutlet var secteur: UITextField!
    @IBOutlet var langue: UITextField!
    @IBOutlet var cause: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewNatureB.delegate = self
        textViewInstructionSp.delegate = self
        
        textViewNatureB.text = "Nature du Bénévolat"
        textViewNatureB.textColor = UIColor.lightGray
        
        textViewInstructionSp.text = "Instruction Spécifique"
        textViewInstructionSp.textColor = UIColor.lightGray
        
        
        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textViewNatureB: UITextView) {
        if textViewNatureB.textColor == UIColor.lightGray {
            textViewNatureB.text = nil
            textViewNatureB.textColor = UIColor.black
        }
    }
    
    @IBAction func suivantButton(_ sender: Any) {
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
