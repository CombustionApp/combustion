//
//  CellMoreInfoViewController.swift
//  combustion
//
//  Created by Lucas Andrade on 4/5/16.
//  Copyright © 2016 SergioPichardo. All rights reserved.
//

import UIKit
import Parse

class CellMoreInfoViewController: UIViewController {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelEventName: UILabel!
    @IBOutlet weak var viewHorizontal: UIView!
    @IBOutlet weak var scrollViewHorizontal: UIScrollView!
    @IBOutlet weak var labelNumberGoing: UILabel!
    @IBOutlet weak var imageIconIGo: UIImageView!
    @IBOutlet weak var imageIconLike: UIImageView!
    @IBOutlet weak var labelNumberLiking: UILabel!
    @IBOutlet weak var textViewComment: UITextView!
    @IBOutlet weak var tableViewComments: UITableView!
    @IBOutlet weak var buttonSendComment: UIButton!
    
    @IBOutlet weak var imageEventCategory: UIImageView!
    var event: PFObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let event = event{
            self.labelEventName.text = (event["title"] as! String)

        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonIWillGo(sender: AnyObject) {
        if(self.imageIconIGo.image! == UIImage(named: "iwillgo_Big")){
            self.imageIconIGo.image =  UIImage(named: "iwillgo_Big_blue")
            self.labelNumberGoing.text = String(Int(labelNumberGoing.text!)! + 1)
            self.labelNumberGoing.textColor = UIColor(red: 60/255, green: 135/255, blue: 231/255, alpha: 1)
        }
        else{
            self.imageIconIGo.image =  UIImage(named: "iwillgo_Big")
            self.labelNumberGoing.text = String(Int(labelNumberGoing.text!)! - 1)
            self.labelNumberGoing.textColor = UIColor.whiteColor()
        }
    }
    @IBAction func buttonIlike(sender: AnyObject) {
        if(self.imageIconLike.image! == UIImage(named: "like_big")){
            self.imageIconLike.image =  UIImage(named: "like_big_red")
            self.labelNumberLiking.text = String(Int(labelNumberLiking.text!)! + 1)
            self.labelNumberLiking.textColor = UIColor(red: 250/255, green: 44/255, blue: 52/255, alpha: 1)
        }
        else{
            self.imageIconLike.image =  UIImage(named: "like_big")
            self.labelNumberLiking.text = String(Int(labelNumberLiking.text!)! - 1)
            self.labelNumberLiking.textColor = UIColor.whiteColor()
        }

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
