//
//  DataManager.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import Foundation

class DataManager: NSObject {

    var data : Data?
    var config : Config?
    
    
    class var sharedInstance: DataManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: DataManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = DataManager()
        }
        return Static.instance!
    }
    
    override init() {
        config = Config()
    }
    
    func loadData() {
        
        let originsDataPath = NSBundle.mainBundle().pathForResource("origins", ofType: "json")
        let originsData : NSData = NSData.init(contentsOfFile: originsDataPath!)!
        let origins = try? NSJSONSerialization.JSONObjectWithData(originsData, options: .AllowFragments)
        
        let namesDataPath = NSBundle.mainBundle().pathForResource("data", ofType: "json")
        let namesData : NSData = NSData.init(contentsOfFile: namesDataPath!)!
        let names = try? NSJSONSerialization.JSONObjectWithData(namesData, options: .AllowFragments)
        
        data = Data(namesData: names! as! NSArray, originsData: origins! as! NSArray)
    }
    
    func originByID(id : NSString) -> Origin {
        return data?.origins.filteredArrayUsingPredicate(NSPredicate(format: "id == %@", id)).first as! Origin
    }
    
    func recomendedByIDs(ids : NSArray) -> NSArray {
        let predicate = NSPredicate(format: "id IN %@", ids)
        return (data?.allNames.filteredArrayUsingPredicate(predicate))!
    }
}
