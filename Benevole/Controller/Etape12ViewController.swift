//
//  Etape12ViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 19/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class Etape12ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let selectPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        circularImageview.image = selectPhoto
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        print("image button tapped")
        
        
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBOutlet weak var circularImageview: UIImageView!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
}
