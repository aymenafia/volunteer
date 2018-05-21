//
//  Etape2ViewController.swift
//  Benevole
//
//  Created by Mohamed aymen AFIA on 18/05/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class Etape2ViewController: UIViewController {
    
var posts : String?
    @IBOutlet var tache: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
 let des = UserDefaults.standard.value(forKey: "description") as? String
        print(des)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func suivantButton(_ sender: Any) {
        
         UserDefaults.standard.set(tache.text!, forKey: "tache")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
