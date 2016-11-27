//
//  Bet.swift
//  RunningWager
//
//  Created by Zach Johnson on 11/25/16.
//  Copyright © 2016 Zach Johnson. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

struct Bet {
    
    let addedByUser: String
    let distance: Int
    let time: Int
    let date: String
    let itemRef: FIRDatabaseReference?
    let key: String
    
    init (addedByUser: String, distance: Int, time: Int, date: String, key: String = ""){
        self.addedByUser = addedByUser
        self.distance = distance
        self.time = time
        self.date = date
        self.key = key
        self.itemRef = nil
        
        
    }
    
    init (snapshot: FIRDataSnapshot) {
        key = snapshot.key
        
        
        let snapshotValue = snapshot.value as? [String: AnyObject]
        
        self.addedByUser = snapshotValue?["user"] as? String ?? "fuck you"
        self.distance = snapshotValue?["distance"] as? Int ?? 0
        self.time = snapshotValue?["time"] as? Int ?? 0
        self.date = snapshotValue?["date"] as? String ?? ""
        
        itemRef = snapshot.ref
    }
    
    
    func toAnyObject() -> Any {
        
        return [
            "user": addedByUser,
            "distance": distance,
            "time": time,
            "date": date,
        ]
    }
}
