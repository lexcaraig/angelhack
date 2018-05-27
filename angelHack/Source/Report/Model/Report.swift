//
//  Report.swift
//  angelHack
//
//  Created by alvin joseph valdez on 27/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation
import Firebase

public struct Report {
    
    let ref: DatabaseReference?
    let key: String
    let userName: String
    let description: String
    let geoLocation: [String]
    let attachments: String
    let type: String
    let status: Int
    var completed: Bool
    
    init(userName: String, completed: Bool, key: String = "", attachments: String, description: String) {
        self.ref = nil
        self.key = key
        self.userName = "juan.d@gmail.com"
        self.geoLocation =  ["14.2530", "121.6374"]
        self.type = "Medical"
        self.status = 0
        self.attachments = attachments
        self.description = description
        self.completed = true
    }
    
//    init?(data: AnyObject) {
//        data.values
//        guard
//            let value = data.value,
//            let username = value["userName"] as? String,
//            let description = value["description"] as? String
//            else {
//                return nil
//            }
//
////        self.ref = snapshot.ref
////        self.key = snapshot.key
//        self.userName = username
//        self.description = description
//        self.status = 0
//        self.attachments = ""
//        self.completed = true
//        self.type = "Medical"
//    }
    
    func toAnyObject() -> Any {
        return [
            "userName": self.userName,
            "description": self.description,
            "geoLocation": self.geoLocation,
            "attachments": self.attachments,
            "type": self.type,
            "status": self.status,
            "timestamp": "\(Date())"
        ]
    }
}
