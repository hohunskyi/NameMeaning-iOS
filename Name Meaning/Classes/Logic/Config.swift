//
//  Config.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class Config: NSObject {

    var showWelcomeMessage : Bool
    var targetParams : TargetParams
    
    
    override init() {
        
        #if ENGLISH
        targetParams = TargetParams(primaryColor: UIColor(red: 199/255, green: 68/255, blue: 52/255, alpha: 1.0),
                                    bannerID: "ca-app-pub-2341663595915245/9259259818", interstitialID:"ca-app-pub-2341663595915245/4252025812")
        #else
        targetParams = TargetParams(primaryColor: UIColor(red: 54/255, green: 98/255, blue: 187/255, alpha: 1.0),
                                    bannerID: "ca-app-pub-2341663595915245/6166192619", interstitialID: "ca-app-pub-2341663595915245/1298559414")
        #endif
        
        let defaults =  NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey("showWelcomeMessage") == nil {
            defaults.setBool(true, forKey: "showWelcomeMessage")
        }
        showWelcomeMessage = defaults.boolForKey("showWelcomeMessage")
    }
    
    func setShouldShowWelcomeMessage(value : Bool) {
        showWelcomeMessage = value
        NSUserDefaults.standardUserDefaults().setBool(showWelcomeMessage, forKey: "showWelcomeMessage")
    }
    
}
