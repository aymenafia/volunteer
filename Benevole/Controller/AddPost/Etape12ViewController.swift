//
//  Etape12ViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 19/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import Firebase
class Etape12ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
 var ref: DatabaseReference!
    var UserUID:String?
    var imageURL:String?
    
    var imagePath:String = "no image"
    @IBOutlet weak var circularImageview: UIImageView!
    
    @IBOutlet var titreTF: UITextField!
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func uploadButton(_ sender: Any) {
        
        
        collectData()
        
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
    

    func collectData(){
            UploadImage(image: circularImageview.image!)
        let nature =  UserDefaults.standard.value(forKey: "nature") as? String
        let instruction =  UserDefaults.standard.value(forKey:"instruction") as? String
        let durée =  UserDefaults.standard.value(forKey: "durée") as? String
        let nombrePoste =  UserDefaults.standard.value(forKey:"nombrePoste") as? String
        let secteur =  UserDefaults.standard.value(forKey: "secteur") as? String
        let langue =  UserDefaults.standard.value(forKey: "langue") as? String
        let cause =  UserDefaults.standard.value(forKey: "cause") as? String
        
        
        let competence =  UserDefaults.standard.value(forKey: "competence") as? String
        let tache =  UserDefaults.standard.value(forKey: "tache") as? String
        let description =  UserDefaults.standard.value(forKey: "description") as? String
        
        
       // let titre =  UserDefaults.standard.value(forKey: "titre") as? String
        UserDefaults.standard.set(titreTF.text, forKey: "titre")
        
        
        ref = Database.database().reference()
        var postMsg = ["userUID":UserUID!,"nature":nature,"imagePath":imageURL,"postDate":ServerValue.timestamp(),"instruction":instruction,"durée":durée,"nombrePoste":nombrePoste,"secteur":secteur,"langue":langue,"cause":cause,"competence":competence,"tache":tache,"description":description,"titre":titreTF.text!] as [String : Any]
        ref.child("Posts").childByAutoId().setValue(postMsg)
        
    
  }
    
    func UploadImage(image:UIImage){
        
        
        let storageRef = Storage.storage().reference(forURL:"gs://notrequebec-67065.appspot.com")
        
        var data = NSData()
        data = UIImageJPEGRepresentation(image,0.8) as! NSData
        let dataformat = DateFormatter()
        dataformat.dateFormat = "MM_DD_yy_h_mm_a"
        let imageName = "\(self.UserUID!)_ \(dataformat.string(from: NSDate() as Date))"
        
        imagePath = "OrganisationPosts//\(imageName).jpg"
        imageURL = imagePath
        let childUserImages =  storageRef.child(imagePath)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        //Upload image
        childUserImages.putData(data as Data, metadata: metaData)
        
        //save to datab ase
        //SaveToFirebaseDabase(UserImagePath: imagePath,UserName: txtusername.text!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let nature =  UserDefaults.standard.value(forKey: "nature") as? String
        let instruction =  UserDefaults.standard.value(forKey:"instruction") as? String
        let durée =  UserDefaults.standard.value(forKey: "durée") as? String
        let nombrePoste =  UserDefaults.standard.value(forKey:"nombrePoste") as? String
        let secteur =  UserDefaults.standard.value(forKey: "secteur") as? String
        let langue =  UserDefaults.standard.value(forKey: "langue") as? String
        let cause =  UserDefaults.standard.value(forKey: "cause") as? String
        
        
        let competence =  UserDefaults.standard.value(forKey: "competence") as? String
        let tache =  UserDefaults.standard.value(forKey: "tache") as? String
        let description =  UserDefaults.standard.value(forKey: "description") as? String
        
        print(nature,instruction,durée,nombrePoste,secteur,langue,cause,competence,tache,description)
        
        
        let user = Auth.auth().currentUser
        UserUID = (user?.uid)!
        // Do any additional setup after loading the view.
    }

   
}
