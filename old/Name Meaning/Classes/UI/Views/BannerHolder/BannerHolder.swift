//
//  BannerHolder.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/12/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

#if FREE
    import GoogleMobileAds
#endif

class BannerHolder: UIView {
    
    #if FREE
    var bannerView: GADBannerView!
    #endif
    
    @IBOutlet weak var rootViewController: UIViewController!
    
    override func awakeFromNib() {
        
        #if FREE
            bannerView = GADBannerView(frame:self.bounds)
            bannerView.adUnitID = DataManager.sharedInstance.config?.targetParams.appBannerID as? String
            bannerView.rootViewController = rootViewController
            let request = GADRequest()
            request.testDevices = [kGADSimulatorID]
            bannerView.loadRequest(request)
            self.addSubview(bannerView)
        #endif
        
    }
    
}
