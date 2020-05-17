//
//  TargetParams.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/10/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class TargetParams: NSObject {

    var appPrimaryColor : UIColor!
    var appBannerID : NSString!
    var appInterstitialID : NSString!
    
    
    init(primaryColor: UIColor, bannerID : NSString, interstitialID : NSString) {
        appPrimaryColor = primaryColor
        appBannerID = bannerID
        appInterstitialID = interstitialID
    }
}

