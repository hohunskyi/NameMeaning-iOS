//
//  Name.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import Foundation

class Name: NSObject, NSCoding {

    struct KEYS {
        private static let ID = "ZID"
        private static let NAME = "ZNAME"
        private static let MEANING = "ZMEANING"
        private static let RATING = "ZRATING"
        private static let NOTES = "ZNOTES"
        private static let SEX = "ZSEX"
        private static let RECOMMENDED = "ZRECOMMENTED"
        private static let STATS = "ZSTATS"
        private static let ORIGIN = "ZORIGIN"
        private static let OVERVIEW = "ZOVERVIEW"
    }

    var id : NSString
    var name : NSString
    var meaning : NSString
    var rating : NSString
    var sex : NSString
    var origin : NSString
    var stats : Stats
    var notes  : NSString
    var recommended : NSArray
    var overview : NSString


    init(nameData : NSDictionary) {
        id = nameData[KEYS.ID] as! NSString
        name = nameData[KEYS.NAME] as! NSString
        rating = nameData[KEYS.RATING] as! NSString
        sex = nameData[KEYS.SEX] as! NSString

        if let theMeaning = nameData[KEYS.MEANING] {
            meaning = theMeaning  as! NSString
        } else {
            meaning = ""
        }
        
        if let theNotes = nameData[KEYS.NOTES] {
            notes = theNotes  as! NSString
        } else {
            notes = ""
        }
        
        if let theOrigin = nameData[KEYS.ORIGIN] {
            origin = theOrigin  as! NSString
        } else {
            origin = ""
        }
        
        if let theStats = nameData[KEYS.STATS] {
            stats = Stats(dict: theStats as! NSDictionary)
        } else {
            stats = Stats(dict:[:])
        }
        
        if let recommndedString = nameData[KEYS.RECOMMENDED] {
            if (recommndedString as! NSString).length > 0 {
                recommended = (recommndedString as! NSString).componentsSeparatedByString(",")
            } else {
                recommended = NSArray()
            }
        } else {
            recommended = NSArray()
        }
        
        if let theOverview = nameData[KEYS.OVERVIEW] {
            overview = NSString(format: "<span style=\"font-family:-apple-system; font-size: 16\">%@</span>", theOverview as! NSString)
        } else {
            overview = ""
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey(KEYS.ID) as! NSString
        name = aDecoder.decodeObjectForKey(KEYS.NAME) as! NSString
        meaning = aDecoder.decodeObjectForKey(KEYS.MEANING) as! NSString
        rating = aDecoder.decodeObjectForKey(KEYS.RATING) as! NSString
        sex = aDecoder.decodeObjectForKey(KEYS.SEX) as! NSString
        origin = aDecoder.decodeObjectForKey(KEYS.ORIGIN) as! NSString
        stats = aDecoder.decodeObjectForKey(KEYS.STATS) as! Stats
        notes = aDecoder.decodeObjectForKey(KEYS.NOTES) as! NSString
        overview = aDecoder.decodeObjectForKey(KEYS.OVERVIEW) as! NSString
        recommended = aDecoder.decodeObjectForKey(KEYS.RECOMMENDED) as! NSArray
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey:KEYS.ID)
        aCoder.encodeObject(name, forKey:KEYS.NAME)
        aCoder.encodeObject(meaning, forKey:KEYS.MEANING)
        aCoder.encodeObject(rating, forKey:KEYS.RATING)
        aCoder.encodeObject(sex, forKey:KEYS.SEX)
        aCoder.encodeObject(origin, forKey:KEYS.ORIGIN)
        aCoder.encodeObject(stats, forKey:KEYS.STATS)
        aCoder.encodeObject(notes, forKey:KEYS.NOTES)
        aCoder.encodeObject(overview, forKey:KEYS.OVERVIEW)
        aCoder.encodeObject(recommended, forKey:KEYS.RECOMMENDED)
    }
}
