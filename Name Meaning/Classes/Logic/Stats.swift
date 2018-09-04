//
//  Stats.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import Foundation

class Stats: NSObject, NSCoding {
    
    struct KEYS {
        private static let DATA = "DATA"
    }
    
    var data : NSDictionary

    
    init(dict : NSDictionary) {
        data = dict
    }
    
    required init(coder aDecoder: NSCoder) {
        data = aDecoder.decodeObjectForKey(KEYS.DATA) as! NSDictionary
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(data, forKey:KEYS.DATA)
    }
    
    func keys() -> [String] {
        return (data.allKeys as! [String]).sort(<)
    }
    
    func values() -> [String] {
        let keys : [String] = self.keys()
        var values : [String] = []
        for i in 0..<keys.count {
            let value =  data[keys[i]] as! String
            values.append(value)
        }
        
        return values
    }
}