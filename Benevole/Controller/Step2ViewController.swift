//
//  Step2ViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 17/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import BulletinBoard

import Firebase
import FirebaseAuth

import FirebaseStorage
import FirebaseDatabase


class Step2ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    var posts : Post!
    var Useruid : String?

    var organisation: Organisation!
    
    var x: String = ""
    var ref: DatabaseReference!
    
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

    let page = PageBulletinItem(title: "Bienvenue")

    @IBAction func test(_ sender: Any) {
        
        page.manager?.backgroundViewStyle = .blurredExtraLight
        page.manager?.prepare()
        page.image = UIImage(named: "checked")
        page.descriptionText = "Merci pour votre confiance"
        page.actionButtonTitle = "confirmer"
        page.alternativeButtonTitle = "annuler"
        // Do any additional setup after loading the view.
        
        
        
        var bulletinManager: BulletinManager = {
            let rootItem: BulletinItem = page
            return BulletinManager(rootItem: rootItem)
        }()
        
        
        let greenColor = UIColor(red: 0.294, green: 0.85, blue: 0.392, alpha: 1)
        page.interfaceFactory.tintColor = greenColor
  
        page.interfaceFactory.actionButtonTitleColor = .white
        
        bulletinManager.prepare()
        bulletinManager.presentBulletin(above: self)
        
       
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      ref = Database.database().reference()
        
        
        
        
       print(organisation.CentreActionBenevole!)
        print(organisation.RegionAdministrative!)
        print(organisation.siteInternet!)
        print(organisation.nomOrganisation!)
        
     circularImageview.layer.cornerRadius = circularImageview.frame.size.width/2
        circularImageview.clipsToBounds = true
        page.actionHandler = { (item: PageBulletinItem) in
            print("Action button tapped")
            self.SignUP()
            
        }
       
        
        page.alternativeHandler = { (item: PageBulletinItem) in
            print("Alternative button tapped")
            
self.dismiss(animated: true, completion: nil)        }
        
        
    }

   
    func Signin() {
        
        
        Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
            }else{
                
                self.Useruid = (user?.uid)!
                print((user?.uid)!)
                print("SigningUP")
            
            }
            
        }
        
    }
    func SignUP(){
        
        
        Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
            }else{
                self.Useruid = (user?.uid)!
               self.UploadImage()
                print((user?.uid)!)
                
            }
            
            
            
            
        }
        
        
        
        
    }
    func SaveToFirebaseDabase(organisation:Organisation,OrgImagePath:String){
        print(organisation.CentreActionBenevole!)
        print(organisation.RegionAdministrative!)
        print(organisation.siteInternet!)
        print(organisation.nomOrganisation!)
        organisation.ImageOrganisation = OrgImagePath
        //Organisation(userUID: "", nomOrganisation: nomOrganisation, siteInternet: internetSite, RegionAdministrative: regionAdministrative, CentreActionBenevole: actionBenevole, ImageOrganisation: "", EmailOrganisation: "")
        
        let msg = ["CentreActionBenevole":organisation.CentreActionBenevole!,"RegionAdministrative":organisation.RegionAdministrative!,"nomOrganisation":organisation.nomOrganisation!,"siteInternet":organisation.siteInternet!,"OrgImagePath":OrgImagePath]
        ref.child("Organisation").child(self.Useruid!).setValue(msg)
        
    }

    
    func UploadImage(){
        
        
        let storageRef = Storage.storage().reference(forURL:"gs://notrequebec-67065.appspot.com")
        
        var data = NSData()
        data = UIImageJPEGRepresentation(circularImageview.image!,0.8) as! NSData
        let dataformat = DateFormatter()
        dataformat.dateFormat = "MM_DD_yy_h_mm_a"
        let imageName = "\(self.Useruid!)_ \(dataformat.string(from: NSDate() as Date))"
        
        let imagePath = "OrganisationImages/\(imageName).jpg"
        let childUserImages =  storageRef.child(imagePath)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        //Upload image
        childUserImages.putData(data as Data, metadata: metaData)
        //save to database
        SaveToFirebaseDabase(organisation: organisation, OrgImagePath: imagePath)
    }
    
    
    
    
    
}
