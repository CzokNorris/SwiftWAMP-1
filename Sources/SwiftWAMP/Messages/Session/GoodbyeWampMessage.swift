//
//  GoodbyeWampMessage.swift
//  
//
//  Created by Jordan Anders on 2020-09-21.
//

import Foundation
import SwiftyJSON

/// [GOODBYE, details|dict, reason|uri]
class GoodbyeWampMessage: WampMessage {
    
    let details: [String: AnyObject]
    let reason: String
    
    init(details: [String: AnyObject], reason: String) {
        self.details = details
        self.reason = reason
    }
    
    // MARK: WampMessage protocol
    
    required init(payload: [Any]) {
        self.details = payload[0] as! [String: AnyObject]
        self.reason = payload[1] as! String
    }
    
    func marshal() -> [Any] {
        return [WampMessages.goodbye.rawValue, self.details, self.reason]
    }
}