//
//  LoginViewController.swift
//  combustion
//
//  Created by Jacob Hughes on 3/23/16.
//  Copyright © 2016 SergioPichardo. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var UserNameText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    @IBAction func SignUp(sender: AnyObject) {
        let newUser = PFUser()
        
        print(newUser)
        
        newUser.username = UserNameText.text
        print(newUser)
        newUser.password = PasswordText.text
        
        if PFUser.currentUser() != nil{
            print("there is not current User")
        }
        
        
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            
            if success {
                print("New User created- user: \(newUser.username) pass: \(newUser.password)")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    @IBAction func SignIn(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
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
