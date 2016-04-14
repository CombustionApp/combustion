//
//  LoginViewController.swift
//  combustion
//
//  Created by Jacob Hughes on 3/23/16.
//  Copyright © 2016 SergioPichardo. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD


class LoginViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
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
                self.defaults.setBool(true, forKey: "firstTime")
                self.performSegueWithIdentifier("editSegue", sender: nil)
                
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    @IBAction func SignIn(sender: AnyObject) {
        
        // Display HUD right before the request is made
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        
        
        PFUser.logInWithUsernameInBackground(UserNameText.text!, password: PasswordText.text!)
        { (user: PFUser?, error: NSError?) -> Void in
            if user != nil{
                print("you are logged in")
                
                self.defaults.setBool(false, forKey: "firstTime")
                // Hide HUD once the network request comes back (must be done on main UI thread)
                MBProgressHUD.hideHUDForView(self.view, animated: true)
                
                let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("home") as! ViewController
      
                self.navigationController!.pushViewController(viewController, animated: true)
            }
            else{
                // Hide HUD once the network request comes back (must be done on main UI thread)
                MBProgressHUD.hideHUDForView(self.view, animated: true)
                
                //alert of wrong action
                let alert = UIAlertController(title: "Incorrect username or password ", message: "Please, try again", preferredStyle: .Alert)
                let okAction = UIAlertAction(title: "Ok", style: .Default) { (action: UIAlertAction) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        
        
        PFUser.logInWithUsernameInBackground(UserNameText.text!, password: PasswordText.text!)
            { (user: PFUser?, error: NSError?) -> Void in
                if user != nil{
                    print("you are logged in")
                    
                    self.defaults.setBool(false, forKey: "firstTime")
                    self.defaults.setObject(user, forKey: "currentUser")
                    // Hide HUD once the network request comes back (must be done on main UI thread)
                    MBProgressHUD.hideHUDForView(self.view, animated: true)
                    
                    let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("home") as! ViewController
                    
                    self.navigationController!.pushViewController(viewController, animated: true)
                }
                else{
                    // Hide HUD once the network request comes back (must be done on main UI thread)
                    MBProgressHUD.hideHUDForView(self.view, animated: true)
                    
                    //alert of wrong action
                    let alert = UIAlertController(title: "Incorrect username or password ", message: "Please, try again", preferredStyle: .Alert)
                    let okAction = UIAlertAction(title: "Ok", style: .Default) { (action: UIAlertAction) -> Void in
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                    alert.addAction(okAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                
        }
    

        
        
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
