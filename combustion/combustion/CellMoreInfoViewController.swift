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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
