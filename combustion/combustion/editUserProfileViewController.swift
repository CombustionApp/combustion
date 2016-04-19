//
//  editUserProfileViewController.swift
//  combustion
//
//  Created by Jacob Hughes on 4/11/16.
//  Copyright © 2016 SergioPichardo. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class editUserProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var placeholderImage: UIImage!

    @IBOutlet weak var profileImageView: PFImageView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    var user = PFUser.currentUser()
    var pickerController = UIImagePickerController()
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.boolForKey("firstTime") == true {
            skipButton.hidden = false
        } else {
            skipButton.hidden = true
        }
        
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        if user!["profile_image"] != nil {
            profileImageView.file = user!["profile_image"] as? PFFile
            profileImageView.loadInBackground()
        }
        if user!["name"] != nil {
            nameField.text = String(user!["name"])
        }
        if user!.email != nil {
            emailField.text = user!.email
        }
        if user!["age"] != nil {
            ageField.text = String(user!["age"])
        }
        if user!["bio"] != nil {
            bioTextView.text = String(user!["bio"])
        }
        if user!["gender"] != nil {
            genderSegment.selectedSegmentIndex = Int(String(user!["gender"]))!
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        
        defaults.setBool(false, forKey: "firstTime")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateProfileAction(sender: AnyObject) {
        
        if let user = PFUser.currentUser(){
            let imageData: NSData
            if placeholderImage != nil {
                imageData = UIImagePNGRepresentation(placeholderImage)!
            } else {
                imageData = UIImagePNGRepresentation(UIImage(named: "Beautiful")!)!
            }
            print("Before \(user)")
            user["profile_image"] = PFFile(data: imageData)
            print("PROF IMAG \(user["profile_image"])")
            user["name"] = nameField.text
            user.email = emailField.text
            user["age"] = ageField.text
            user["bio"] = bioTextView.text
            user["gender"] = genderSegment.selectedSegmentIndex
            print("after \(user)")
            
            
           
            user.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                if (success) {
                    print("IT WORKEd maybe idk anymore")
                } else {
                    print("well... shit")
                }
            })
        
    }
    }
    @IBAction func editPictureAction(sender: AnyObject) {
        
        self.presentViewController(pickerController, animated: true, completion: nil)
        
    }

    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        placeholderImage = originalImage
        
        placeholderImage = resize(originalImage, newSize: CGSize(width: 120, height: 120))
        profileImageView.image = placeholderImage
        dismissViewControllerAnimated(true, completion: nil)
        

    
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
