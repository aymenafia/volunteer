//
//  ProfileViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 18/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import StretchHeader


import UIKit

class ProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 8
        // Do any additional setup after loading the view.
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let selectPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = selectPhoto
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        print("image button tapped")
        
        
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBOutlet weak var imageView: UIImageView!
}
