//
//  User.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 20/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//




import Foundation




class Organisation {
    

    var userUID:String?
     var nomOrganisation:String?
    var siteInternet:String?
    var RegionAdministrative:String?
    var CentreActionBenevole:String?
    var ImageOrganisation:String?
    var EmailOrganisation:String?
    var AdressOrganisation:String?
    var TélOrganisation:String?
    
    init(userUID:String,nomOrganisation:String,siteInternet:String,RegionAdministrative:String,CentreActionBenevole:String,ImageOrganisation:String,EmailOrganisation:String){
        
        self.siteInternet = siteInternet
        self.userUID = userUID
        self.RegionAdministrative = RegionAdministrative
        self.CentreActionBenevole = CentreActionBenevole
        self.ImageOrganisation = ImageOrganisation
        self.EmailOrganisation = EmailOrganisation
        self.nomOrganisation = nomOrganisation
    }
    
    
    
}










