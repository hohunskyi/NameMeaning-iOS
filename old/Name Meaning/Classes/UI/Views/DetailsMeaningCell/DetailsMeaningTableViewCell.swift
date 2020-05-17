//
//  DetailsTitleTableViewCell.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class DetailsMeaningTableViewCell: DetailsBaseTableViewCell {

    @IBOutlet weak var meaningLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func update(object: AnyObject) {
        
        let meaning = NSLocalizedString("Meaning", comment: "");
        let attrString = NSMutableAttributedString(string: NSString(format: "%@: %@", meaning , (object as! Name).meaning  as String) as String)
        attrString.addAttributes([NSFontAttributeName : UIFont.boldSystemFontOfSize(17)], range: NSMakeRange(0, meaning.characters.count + 1))
        
        meaningLabel.attributedText = attrString
    }
    
}
