//
//  ListViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 19/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
@IBOutlet var tvListPosts: UITableView!
    
    var listOfPosts = [Post]()
    var listOfPosts2 = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //listOfPosts.append(Post(postTitre: "facilitateur immersion culturelle", userUID: "", postDate: "2018-05-17",postSecteur: "Action bénévole"))
        //print("user uit\(UserUID!)")
        listOfPosts.append(Post(userUID: "", postTitre: "facilitateur immersion culturelle", postDescrition: "Description", postTache: "Tache", postCompetence: "Competence", postNature: "Nature", postInstruction: "Instruction", postDurée: "Durée", postNombrePost: "Nombre de post", postSecteur: "Action bénévole", postLangue: "Langue", postCause: "Cause", postDate: "Langue", postImage: "Cause"))
        
        tvListPosts.delegate = self
        tvListPosts.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listOfPosts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = listOfPosts[indexPath.row]

        let cellWithImage = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! PostTableViewCell
        
        
        
        cellWithImage.setText(post: post)
        return cellWithImage
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Edit") as! EditPostViewController
        
        
        vc.posts = listOfPosts[indexPath.row]
        self.show(vc, sender: nil)
        //self.performSegue(withIdentifier: "step12", sender: nil)
        
    }
    
    
    
    
}
