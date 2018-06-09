//
//  DescViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 03/06/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher
class DescViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var ref: DatabaseReference!
    var postDetails : Post!
    var UserUID:String?
    var UserImagePath: String?
    
    
    let listOfDesc = ["Secteur","Description de l'offre","Tache","Compétences Recherchées","Instruction Supplémentaire","Nature","Durée","Nombre de Poste","Secteur d'activité","Langue","Cause"]
    
    @IBOutlet var imageOrg: UIImageView!
    
    @IBOutlet var CentreActionBenevole: UILabel!
    
    @IBOutlet var RegionAdministrative: UILabel!
    
    @IBOutlet var address: UILabel!
    
    @IBOutlet var nomOrganisation: UILabel!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var siteInternet: UILabel!
    
    @IBOutlet var tel: UILabel!
    
    
    @IBOutlet weak var PostImageview: UIImageView!
    
    
    @IBOutlet var TitreTextField: UILabel!
    
    
    @IBOutlet var DescritionTextVIew: UITextView!
    
    @IBOutlet var CompetenceTextView: UITextView!
    @IBOutlet var TacheTextView: UITextView!
    
    
    @IBOutlet var textViewNatureB: UITextView!
    @IBOutlet var textViewInstructionSp: UITextView!
    
    @IBOutlet var DuréeTextField: UILabel!
    
    @IBOutlet var NombredePosteTextField: UILabel!
    
    @IBOutlet var SecteurTextField: UILabel!
    
    
    @IBOutlet var LangueTextField: UILabel!
    
    
    @IBOutlet var CauseTextField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = Auth.auth().currentUser
        UserUID = (user?.uid)!
        ref = Database.database().reference()
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        
        
        
        loadUserFormFirebase()
        print(postDetails.postTitre!)
        setUserImage(url:postDetails.postImage!)
        TitreTextField.text = postDetails.postTitre!
//        DescritionTextVIew.text = postDetails.postDescrition!
//        CompetenceTextView.text = postDetails.postCompetence!
//        TacheTextView.text = postDetails.postTache!
//        textViewNatureB.text = postDetails.postNature!
//        textViewInstructionSp.text = postDetails.postInstruction!
//        DuréeTextField.text = postDetails.postDurée!
//        NombredePosteTextField.text = postDetails.postNombrePost!
//        SecteurTextField.text = postDetails.postSecteur!
//        LangueTextField.text = postDetails.postLangue!
//        CauseTextField.text = postDetails.postCause!
        //setOrgImage(url: UserImagePath!)
        dowloadImagePost(url: postDetails.postImage!)
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listOfDesc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let post = listOfPosts[indexPath.row]
        
        let cellWithImage = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
        
        cellWithImage.textLabel?.text = listOfDesc[indexPath.row]
        //cellWithImage.setText(post: post)
        return cellWithImage
        
        
    }
    
    

    func  setUserImage(url:String){
        
        let urll = URL(string: url)
       // self.PostImageview.kf.setImage(with: urll)
    }
    
    
    
    func  setOrgImage(url:String){
        
        let urll = URL(string: url)
        self.imageOrg.kf.setImage(with: urll)
  }
    
    func  dowloadImage(url:String){
        
        let storageRef = Storage.storage().reference(forURL:"gs://notrequebec-67065.appspot.com")
        
        //let postImageRef = storageRef.child(url)
        let orgImageRef = storageRef.child(url).downloadURL { (url, error) in
        self.imageOrg.kf.setImage(with: url!)
        }
        let postImageRef = storageRef.child(url).downloadURL { (url, error) in
            self.imageOrg.kf.setImage(with: url!)
        }
        
//        postImageRef.getData(maxSize: 8 * 1024 * 1024) { (data, error) in
//
//            if let error = error{
//                print("cannot load image")
//            }else{
//                self.imageOrg.image = UIImage(data:data!)
//
//            }
//
//        }
        
        
    }
    func  dowloadImagePost(url:String){
        
        let storageRef = Storage.storage().reference(forURL:"gs://notrequebec-67065.appspot.com")
        
        //let postImageRef = storageRef.child(url)
      
        let postImageRef = storageRef.child(url).downloadURL { (url, error) in
            self.PostImageview.kf.setImage(with: url!)
        }
        
        //        postImageRef.getData(maxSize: 8 * 1024 * 1024) { (data, error) in
        //
        //            if let error = error{
        //                print("cannot load image")
        //            }else{
        //                self.imageOrg.image = UIImage(data:data!)
        //
        //            }
        //
        //        }
        
        
    }
    func loadUserFormFirebase(){
        
        ref.child("Organisation").child (self.postDetails.userUID!).observe(.value, with: {
            (snapshot) in
            
            //print(snapshot)
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                
                for snap in snapshot{
                    
                    if let postKey = snap.key as? String{
                        
                        if postKey == "CentreActionBenevole" {
                            
                            let fullName = snap.value as? String
                            self.CentreActionBenevole.text = fullName
                        }
                        if postKey == "RegionAdministrative" {
                            
                            let fullName = snap.value as? String
                            self.RegionAdministrative.text = fullName
                        }
                        if postKey == "nomOrganisation" {
                            
                            let fullName = snap.value as? String
                            self.nomOrganisation.text = fullName
                        }
                        
                        if postKey == "OrgImagePath" {
                            
                            self.UserImagePath = (snap.value as! String)
                          
                            self.dowloadImage(url:self.UserImagePath!)
                            //self.setUserImage(url: UserImagePath!)
                            //let urll =
                            
                        }
                        
                        if postKey == "siteInternet" {
                            
                            let fullName = snap.value as? String
                            self.siteInternet.text = fullName
                        }
                        if postKey == "address" {
                            
                            let fullName = snap.value as? String
                            self.address.text = fullName
                        }
                        if postKey == "tel" {
                            
                            let fullName = snap.value as? String
                            self.tel.text = fullName
                        }
                        if postKey == "email" {
                            
                            let fullName = snap.value as? String
                            //self.emailLbl.text = fullName
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
