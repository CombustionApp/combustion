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
        event["likes_count"] = 0
        event["going_count"] = 0
        
        
        event.saveInBackgroundWithBlock(completion)
           
    }
    class func fetchAllEvents(viewController: ViewController!, withCompletion completion: PFQueryArrayResultBlock?){
        
        
        let query = PFQuery(className: "Event")
        query.orderByAscending("createdAt")
        query.includeKey("author")
        
        //fetch data asynchronously
        query.findObjectsInBackgroundWithBlock(completion)


    }
    
    class func postLikeToServer(event: PFObject, liking: Bool){
        if liking{
            event["likes_count"] = ((event["likes_count"] as! Int) + 1)
        }
        else{
            event["likes_count"] = ((event["likes_count"] as! Int) - 1)
        }
        
        event.saveInBackground()
    }
    class func postGoingToServer(event:PFObject, going: Bool){
        if going{
            event["going_count"] = ((event["going_count"] as! Int) + 1)

        }
        else{
            event["going_count"] = ((event["going_count"] as! Int) - 1)
        }
        
        event.saveInBackground()

    }
}