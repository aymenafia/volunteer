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
     var postDescrition:String?
    var postLangue:String?
    var postCause:String?
    
    
    init(postTitre:String,userUID:String,postDate:String,postSecteur:String){
        
        self.postTitre = postTitre
        self.userUID = userUID
        self.postDate = postDate
        self.postSecteur = postSecteur

    }
    
    init(userUID:String,postTitre:String,postDescrition:String,postTache:String,postCompetence:String,postNature:String,postInstruction:String,postDurée:String,postNombrePost:String,postSecteur:String,postLangue:String,postCause:String,postDate:String,postImage:String){
        self.userUID = userUID
        self.postTitre = postTitre
        self.postDescrition = postDescrition
        self.postTache = postTache
        self.postCompetence = postCompetence
        self.postNature = postNature
        self.postInstruction = postInstruction
        self.postDurée = postDurée
        self.postNombrePost = postNombrePost
        self.postSecteur = postSecteur
        self.postLangue = postLangue
        self.postCause = postCause
       
        self.postImage = postImage
        self.postDate = postDate
    }
    
    
}
