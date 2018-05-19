//
//  Step2ViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 17/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import BulletinBoard
class Step2ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
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
        
        
        
        
        
     circularImageview.layer.cornerRadius = circularImageview.frame.size.width/2
        circularImageview.clipsToBounds = true
        page.actionHandler = { (item: PageBulletinItem) in
            print("Action button tapped")
        }
       
        
        page.alternativeHandler = { (item: PageBulletinItem) in
            print("Alternative button tapped")
            
self.dismiss(animated: true, completion: nil)        }
        
        
    }

   

}
