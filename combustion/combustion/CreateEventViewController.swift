//
//  CreateEventViewController.swift
//  combustion
//
//  Created by Jacob Hughes on 3/23/16.
//  Copyright © 2016 SergioPichardo. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class CreateEventViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var picEvent: UIImageView!
    @IBOutlet weak var eventTimeField: UITextField!
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventDescription: UITextField!
    @IBOutlet weak var eventPlace: UITextField!
    @IBOutlet weak var categoriesPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var categories: [String] = [String]()
    var catRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoriesPicker.delegate = self
        self.categoriesPicker.dataSource = self
        
        categories = ["Sports", "Health", "Arts", "Meetings", "Dining", "Family", "Nightlife", "Religion", "Festival"]
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        
        // Do any additional setup after loading the view.
        
    }
    
    
    
    @IBAction func photoButton(sender: AnyObject) {
        
        self.presentViewController(UIImagePickerController(), animated: true, completion: nil)
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        catRow = row
        
        return
        
    }
    @IBAction func createEvent(sender: AnyObject) {
        
        //let newEvent = PFObject()
        
        Event.postEvent(withImage: picEvent.image, withTitle: eventTitle.text, withDescription: eventDescription.text, withPlace: eventPlace.text, withTime: datePicker.date, withCategory: categories[catRow]) { (success: Bool, error:NSError?) in
            if(success){
                print("success")
                self.navigationController?.popViewControllerAnimated(true)
            }
            else{
                print("error: \(error?.localizedDescription)")
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        picEvent.image = originalImage
        
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
