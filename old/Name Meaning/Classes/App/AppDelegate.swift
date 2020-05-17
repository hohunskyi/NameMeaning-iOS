
//
//  AppDelegate.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/3/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        DataManager.sharedInstance.loadData();
                
        UINavigationBar.appearance().barTintColor = DataManager.sharedInstance.config?.targetParams.appPrimaryColor
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor(),
                                                            NSFontAttributeName : UIFont.boldSystemFontOfSize(18)]
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        Fabric.with([Crashlytics.self, Answers.self])

        return true
    }
    
//    func loadNames() {
//        do {
//            let db = try Connection("/Users/alenkahohunska/Projects/Name Meaning/Name Meaning/Resources/the-name-meaning.sqlite")
//            
//            let stmt = try db.prepare("INSERT INTO Name (id, name, gender, rating, meaning, notes, origin, stats, recommended) VALUES (?,?,?,?,?,?,?,?,?)")
//            
//            let names =  (DataManager.sharedInstance.data?.allNames)!
//            for  i in 0..<names.count {
//                let name : Name = names[i] as! Name
//                
//                let jsonData =  try NSJSONSerialization.dataWithJSONObject(name.stats.data, options: NSJSONWritingOptions.PrettyPrinted)
//                let theJSONText = NSString(data: jsonData, encoding: NSASCIIStringEncoding)
//              
//                let jsonData2 =  try NSJSONSerialization.dataWithJSONObject(name.recommended, options: NSJSONWritingOptions.PrettyPrinted)
//                let theJSONText2 = NSString(data: jsonData2, encoding: NSASCIIStringEncoding)
//                
//                var sex = "U"
//                if name.sex.isEqualToString("boy") {
//                    sex = "M"
//                } else if name.sex.isEqualToString("girl") {
//                    sex = "F"
//                }
//                
//                try stmt.run(name.id as String,
//                             name.name as String,
//                             sex,
//                             name.rating as String,
//                             name.meaning as String,
//                             name.notes as String,
//                             name.origin as String,
//                             theJSONText as! String,
//                             theJSONText2 as! String
//                )
//            }
//            
//            
//            
//        } catch {
//            
//        }
//
//    }
    
//    func loadOrigins() {
//        do {
//            let db = try Connection("/Users/alenkahohunska/Projects/Name Meaning/Name Meaning/Resources/the-name-meaning.sqlite")
//            
//            let stmt = try db.prepare("INSERT INTO Origin (id, name, continent, flag) VALUES (?,?,?,?)")
//            
//            let origins =  (DataManager.sharedInstance.data?.origins)!
//            for  i in 0..<origins.count {
//                let origin : Origin = origins[i] as! Origin
//                
//                try stmt.run(origin.id as String,
//                             origin.name as String,
//                             origin.continent as String,
//                             origin.flag as String
//                )
//            }
//        } catch {
//            
//        }
//    }


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

