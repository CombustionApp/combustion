//
//  Event.swift
//  combustion
//
//  Created by Lucas Andrade on 4/4/16.
//  Copyright © 2016 SergioPichardo. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import MBProgressHUD

class Event: NSObject {
    
    class func postEvent(withImage image: UIImage?, withTitle title: String?, withDescription description: String?, withPlace place: String?, withTime time: NSDate?, withCategory category: String?, withCompletion completion: PFBooleanResultBlock?) {
        
        let event = PFObject(className: "Event")
        
        let imageData: NSData = UIImagePNGRepresentation(image!)!
        
        event["title"] = title
        event["image"] = PFFile(data: imageData)
        event["description"] = description
        event["place"] = place
        event["time"] = time
        event["category"] = category
        event["author"] = PFUser.currentUser()
        
        
        event.saveInBackgroundWithBlock(completion)
           
    }
    class func fetchAllEvents(viewController: ViewController!, withCompletion completion: PFQueryArrayResultBlock?){
        
        
        let query = PFQuery(className: "Event")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        
        //fetch data asynchronously
        query.findObjectsInBackgroundWithBlock(completion)


    }
}