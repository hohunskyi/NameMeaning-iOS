//
//  Origin.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import Foundation

class Origin: NSObject, NSCoding {
    
    struct KEYS {
        private static let ID = "id"
        private static let NAME = "name"
        private static let CONTINENT = "continent"
        private static let FLAG = "flag"

    }
    
    var id : NSString
    var name : NSString
    var continent : NSString
    var flag : NSString

    
    init(dict : NSDictionary) {
        id = dict[KEYS.ID] as! NSString
        name = dict[KEYS.NAME] as! NSString
        continent = dict[KEYS.CONTINENT] as! NSString
        flag = dict[KEYS.FLAG] as! NSString

    }
    required init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey(KEYS.ID) as! NSString
        name = aDecoder.decodeObjectForKey(KEYS.NAME) as! NSString
        continent = aDecoder.decodeObjectForKey(KEYS.CONTINENT) as! NSString
        flag = aDecoder.decodeObjectForKey(KEYS.FLAG) as! NSString

    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey:KEYS.ID)
        aCoder.encodeObject(name, forKey:KEYS.NAME)
        aCoder.encodeObject(continent, forKey:KEYS.CONTINENT)
        aCoder.encodeObject(flag, forKey:KEYS.FLAG)

    }
}