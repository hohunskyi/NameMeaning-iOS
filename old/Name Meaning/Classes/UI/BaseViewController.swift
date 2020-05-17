//
//  BaseViewController.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/3/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit
import SCLAlertView

#if FREE
    import GoogleMobileAds
#endif

class BaseViewController: UIViewController, GADInterstitialDelegate {

    @IBOutlet weak var bannerView: BannerHolder!
    @IBOutlet weak var bannerViewHeight: NSLayoutConstraint!

    #if FREE
    var interstitial : GADInterstitial?
    #endif

    override func viewDidLoad() {
        super.viewDidLoad()
        
#if FREE
#else
    bannerViewHeight.constant = 0
    bannerView.setNeedsLayout()
#endif
            
        let config : Config = DataManager.sharedInstance.config!
        if config.showWelcomeMessage {
            let alertView = SCLAlertView()
            let subview = UILabel(frame: CGRectMake(0,0,216,140))
            subview.textColor = UIColor.darkGrayColor()
            subview.backgroundColor = UIColor.clearColor()
            subview.numberOfLines = 0
            subview.textAlignment = .Center
            subview.text = NSLocalizedString("Are you looking the best name for your baby? Are you wondering what does your name mean? Will try to help you! Enjoy!", comment: "")
            
            alertView.customSubview = subview
            alertView.showInfo( NSLocalizedString("Welcome!", comment: ""), subTitle: "")
            
            config.setShouldShowWelcomeMessage(false)
        }
    }
    
    
    internal func createAndLoadInterstitial() {
        #if FREE
            let config : Config = DataManager.sharedInstance.config!
            interstitial = GADInterstitial(adUnitID: config.targetParams.appInterstitialID as String)
            interstitial!.delegate = self
            let request = GADRequest()
            request.testDevices = [kGADSimulatorID, "b59c76764fef0d5f8abf518d4e093461"]
            interstitial!.loadRequest(request)
        #endif
    }
    
    func interstitialDidReceiveAd(ad: GADInterstitial!) {
        ad.presentFromRootViewController(self)
    }
    
    func interstitial(ad: GADInterstitial!, didFailToReceiveAdWithError error: GADRequestError!) {
        print(error.localizedDescription)
    }
}

