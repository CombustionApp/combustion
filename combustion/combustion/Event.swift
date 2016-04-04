//
//  Event.swift
//  combustion
//
//  Created by Jacob Hughes on 3/28/16.
//  Copyright © 2016 SergioPichardo. All rights reserved.
//

import UIKit
import Parse
import ParseUI

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
        
        event.saveInBackgroundWithBlock { (Bool, error: NSError?) -> Void in
        
        }
    }
}
