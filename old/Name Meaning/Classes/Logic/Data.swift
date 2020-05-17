//
//  Data.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class Data: NSObject, NSCoding {

    struct KEYS {
        private static let NAMES = "names"
        private static let MALES = "males"
        private static let FEMALES = "females"
        private static let UNISEXS = "unisexs"
        private static let ORIGINS = "origins"
    }
    
    var allNames : NSArray
    var maleNames : NSArray
    var femaleNames : NSArray
    var unisexNames : NSArray
    var origins : NSArray
    
    init(namesData : NSArray, originsData : NSArray) {

        let names : NSMutableArray = NSMutableArray()
        
        for  i in 0..<namesData.count {
            let dict : NSDictionary = namesData[i] as! NSDictionary
            names.addObject(Name(nameData: dict))
        }
        
        let origins : NSMutableArray = NSMutableArray()
        
        for  i in 0..<originsData.count {
            let dict : NSDictionary = originsData[i] as! NSDictionary
            origins.addObject(Origin(dict: dict))
        }
        
        self.allNames = names
        self.maleNames = names.filteredArrayUsingPredicate(NSPredicate(format: "sex == 'boy'")) as NSArray
        self.femaleNames = names.filteredArrayUsingPredicate(NSPredicate(format: "sex == 'girl'")) as NSArray
        self.unisexNames = names.filteredArrayUsingPredicate(NSPredicate(format: "sex == 'unisex'")) as NSArray
        self.origins = origins
        
    }
    
    required init(coder aDecoder: NSCoder) {
        allNames = aDecoder.decodeObjectForKey(KEYS.NAMES) as! NSArray
        maleNames = aDecoder.decodeObjectForKey(KEYS.MALES) as! NSArray
        femaleNames = aDecoder.decodeObjectForKey(KEYS.FEMALES) as! NSArray
        unisexNames = aDecoder.decodeObjectForKey(KEYS.UNISEXS) as! NSArray
        origins = aDecoder.decodeObjectForKey(KEYS.ORIGINS) as! NSArray
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(allNames, forKey:KEYS.NAMES)
        aCoder.encodeObject(maleNames, forKey:KEYS.MALES)
        aCoder.encodeObject(femaleNames, forKey:KEYS.FEMALES)
        aCoder.encodeObject(unisexNames, forKey:KEYS.UNISEXS)
        aCoder.encodeObject(origins, forKey:KEYS.ORIGINS)

    }
}
