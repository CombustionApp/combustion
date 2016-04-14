//
//  userProfileViewController.swift
//  combustion
//
//  Created by Jacob Hughes on 4/11/16.
//  Copyright © 2016 SergioPichardo. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class userProfileViewController: UIViewController {

    @IBOutlet weak var userImage: PFImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    var user = PFUser.currentUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try user!.fetch()
        } catch {
            print(error)
        }
        
        if user!["profile_image"] != nil {
            userImage.file = user!["profile_image"] as? PFFile
            userImage.loadInBackground()
        }
        if user!["name"] != nil {
            nameLabel.text = String(user!["name"])
        }
        if user!["age"] != nil {
            ageLabel.text = String(user!["age"])
        }
        if user!["bio"] != nil {
            bioLabel.text = String(user!["bio"])
        }
        if user!["gender"] != nil {
            if Int(String(user!["gender"])) == 1 {
                genderLabel.text = "Male"
            } else {
                genderLabel.text = "Lucas"
            }
        }
        
        userNameLabel.text = user?.username
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
