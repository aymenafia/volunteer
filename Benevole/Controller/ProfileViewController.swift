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
import Firebase
import UIKit

class ProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    var ref: DatabaseReference!
let userUID = Auth.auth().currentUser?.uid
    var UserData: [Post] = []
    
    @IBOutlet var nomOrganisationLbl: UITextField!
    @IBOutlet var emailLbl: UILabel!
    @IBOutlet var siteInternetLbl: UITextField!
    @IBOutlet var RegionAdministrativeLbl: UITextField!
    @IBOutlet var CentreActionBenevoleLbl: UITextField!
    @IBOutlet var addressLbl: UITextField!
    @IBOutlet var telLbl: UITextField!
    
    var CentreActionBenevole:String?
    var RegionAdministrative:String?
    var nomOrganisation:String?
    var OrgImagePath:String?
    var siteInternet:String?
    var address:String?
    var tel:String?
    var email:String?
    
    
    
    
    
    
    
    
    
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
        
        ref = Database.database().reference()

        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapbutton))
        self.navigationItem.leftBarButtonItem = button
        loadUserFormFirebase()
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

    
    
    
    func  setUserImage(url:String){
        
        let storageRef = Storage.storage().reference(forURL:"gs://notrequebec-67065.appspot.com")
        
        let postImageRef = storageRef.child(url)
        postImageRef.getData(maxSize: 8 * 1024 * 1024) { (data, error) in
            
            if let error = error{
                print("cannot load image")
            }else{
                self.imageView.image = UIImage(data:data!)
                
            }
            
        }
        
        
    }
    
    
    
    
    func loadUserFormFirebase(){
       
        ref.child("Organisation").child ("FonH6Ro8AxbWYPaOSCTYAN5RtHW2").observe(.value, with: {
            (snapshot) in
            
            //print(snapshot)
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                
                for snap in snapshot{
                    
                    if let postKey = snap.key as? String{
                        
                        if postKey == "CentreActionBenevole" {
                            
                            let fullName = snap.value as? String
                            self.CentreActionBenevoleLbl.text = fullName
                        }
                        if postKey == "RegionAdministrative" {
                            
                            let fullName = snap.value as? String
                            self.RegionAdministrativeLbl.text = fullName
                        }
                        if postKey == "nomOrganisation" {
                            
                            let fullName = snap.value as? String
                            self.nomOrganisationLbl.text = fullName
                        }
                        
                        if postKey == "OrgImagePath" {
                            
                            let UserImagePath = snap.value as? String
                            self.setUserImage(url: UserImagePath!)
                            
                        }
                       
                        if postKey == "siteInternet" {
                            
                            let fullName = snap.value as? String
                            self.siteInternetLbl.text = fullName
                        }
                        if postKey == "address" {
                            
                            let fullName = snap.value as? String
                            self.addressLbl.text = fullName
                        }
                        if postKey == "tel" {
                            
                            let fullName = snap.value as? String
                            self.telLbl.text = fullName
                        }
                        if postKey == "email" {
                            
                            let fullName = snap.value as? String
                            self.emailLbl.text = fullName
                        }
                      
                        // print(CentreActionBenevole,RegionAdministrative,OrgImagePath,siteInternet)
                        //self.UserData = [Post(postTitre: titreText!, userUID: userUID!, postDate: "\(postDate!)", postSecteur: secteurText!)]
                        
                        //self.listOfPosts.append(Post(postText: postText!, userUID: userUID!, postDate: "\(postDate!)", postImage: postImage!))
                        
                    }
                    
                }
                
                
                
            }
            
            
        })
       
    }
    
    
    
    
    
    
    
    
    
    
}
