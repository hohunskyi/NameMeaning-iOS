//
//  DetailsTitleTableViewCell.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class DetailsOriginTableViewCell: DetailsBaseTableViewCell {

    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func update(object: AnyObject) {
       
        let originText = NSLocalizedString("Origin", comment: "");
        let origin = DataManager.sharedInstance.originByID((object as! Name).origin)
        
        let attrString = NSMutableAttributedString(string: NSString(format: "%@: %@", originText,  origin.name as String) as String)
        attrString.addAttributes([NSFontAttributeName : UIFont.boldSystemFontOfSize(17)], range: NSMakeRange(0, originText.characters.count))
        
        originLabel.attributedText =  attrString
        flagImage.image = UIImage(named: origin.flag as String)
    }
    
}
