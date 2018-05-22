//
//  PostTableViewCell.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 19/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import Firebase
class PostTableViewCell: UITableViewCell {
    
    var ref: DatabaseReference!

    
    @IBOutlet var iv_postImage: UIImageView!
    @IBOutlet var PostDatePub: UILabel!
    @IBOutlet var PostType: UILabel!
    @IBOutlet var PostText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        iv_postImage.layer.cornerRadius = iv_postImage.frame.size.width/2
        iv_postImage.clipsToBounds = true
        // Initialization code
    }

    
    
    
    func setText(post:Post){
        PostText.text = post.postTitre!
        PostDatePub.text = post.postDate!
        PostType.text  = post.postSecteur
        iv_postImage.image = UIImage(named:"location")
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
