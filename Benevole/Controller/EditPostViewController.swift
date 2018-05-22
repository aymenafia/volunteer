//
//  EditPostViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 19/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class EditPostViewController: UIViewController,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
     @IBOutlet weak var PostImageview: UIImageView!
    
    
    @IBOutlet var TitreTextField: UITextField!
    
    
    @IBOutlet var DescritionTextVIew: UITextView!
    
    @IBOutlet var CompetenceTextView: UITextView!
    @IBOutlet var TacheTextView: UITextView!
    
    
    @IBOutlet var textViewNatureB: UITextView!
    @IBOutlet var textViewInstructionSp: UITextView!
    
    @IBOutlet var DuréeTextField: UITextField!
    
    @IBOutlet var NombredePosteTextField: UITextField!
    
    @IBOutlet var SecteurTextField: UITextField!
    
    
    @IBOutlet var LangueTextField: UITextField!
    
    
    @IBOutlet var CauseTextField: UITextField!
    
    
    
    var posts : Post!
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewNatureB.delegate = self
        textViewInstructionSp.delegate = self
        
        textViewNatureB.text = "Nature du Bénévolat"
        textViewNatureB.textColor = UIColor.lightGray
        
        textViewInstructionSp.text = "Instruction Spécifique"
        textViewInstructionSp.textColor = UIColor.lightGray
        setView()
        
        print(posts)
        
        
        // Do any additional setup after loading the view.
    }

    func textViewDidBeginEditing(_ textViewNatureB: UITextView) {
        if textViewNatureB.textColor == UIColor.lightGray {
            textViewNatureB.text = nil
            textViewNatureB.textColor = UIColor.black
        }
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
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let selectPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        PostImageview.image = selectPhoto
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        print("image button tapped")
        
        
        present(imagePickerController, animated: true, completion: nil)
    }
   
    
    
    func setView(){
        
        
        TitreTextField.text = posts.postTitre!
        
        DescritionTextVIew.text = posts.postDescrition!
        
        CompetenceTextView.text = posts.postCompetence!
        
        TacheTextView.text = posts.postTache!
        
        
        textViewNatureB.text = posts.postNature!
        textViewInstructionSp.text = posts.postInstruction!
        
        DuréeTextField.text = posts.postDurée!
        
        NombredePosteTextField.text = posts.postNombrePost!
        
        SecteurTextField.text = posts.postSecteur!
        
        
        LangueTextField.text = posts.postLangue!
        
        
        CauseTextField.text = posts.postCause!
        
        
        
    }
    

}
