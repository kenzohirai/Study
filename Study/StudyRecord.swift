//
//  StudyRecord.swift
//  Study
//
//  Created by 平井健三 on 2019/08/24.
//  Copyright © 2019 平井健三. All rights reserved.
//

import Foundation

struct StudyRecord {
    var subject: String
    var time: Float
    
    init(subject: String, time: Float) {
        self.subject = subject
        self.time = time
    }
    
    // StudyRecord(dict)
    init(_ dict: Dictionary<String, Any>) {
        subject = dict["subject"] as! String
        time = dict["time"] as! Float
    }
    
    // record.dict
    var dict: Dictionary<String, Any> {
        get {
            var newDict: Dictionary<String, Any> = [:]
            newDict["subject"] = subject
            newDict["time"] = time
            return newDict
        }
    }
}
