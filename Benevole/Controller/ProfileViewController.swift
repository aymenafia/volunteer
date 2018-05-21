//
//  ProfileViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 18/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import StretchHeader
import FirebaseAuth

import UIKit

class ProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBAction func logout(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            //navigationController?.dismiss(animated: true, completion: nil)
            
            
            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nav = mainStoryboardIpad.instantiateViewController(withIdentifier: "FirstNav") as! UINavigationController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = nav
            
            
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 8
        
        
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapbutton))
        self.navigationItem.leftBarButtonItem = button
        
        // Do any additional setup after loading the view.
    }
    
    @objc func tapbutton(){
        
        
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
