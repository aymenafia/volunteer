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
    @IBOutlet var countLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        iv_postImage.layer.cornerRadius = iv_postImage.frame.size.width/2
        iv_postImage.clipsToBounds = true
        // Initialization code
    }

   
    
    
    var count : Int!
    func setText(post:Post){
        let x = Double(post.postDate!)! / 1000
        let date = NSDate(timeIntervalSince1970: x)
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        
        PostText.text = post.postTitre!
        PostDatePub.text = String(formatter.string(from: date as Date))
        PostType.text  = post.postSecteur
        iv_postImage.image = UIImage(named:post.postSecteur!)
        
        countLbl.text = String(count + 1)
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
