//
//  Post.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 19/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import Foundation




class Post {
    
     var userUID:String?
     var postTitre:String?
     var postTache:String?
     var postCompetence:String?
     var postNature:String?
     var postInstruction:String?
     var postDurée:String?
     var postNombrePost:String?
     var postSecteur:String?
     var postDate:String?
     var postImage:String?
    
    init(postTitre:String,userUID:String,postDate:String,postSecteur:String){
        
        self.postTitre = postTitre
        self.userUID = userUID
        self.postDate = postDate
        self.postSecteur = postSecteur

    }
    
    
    
    
}
