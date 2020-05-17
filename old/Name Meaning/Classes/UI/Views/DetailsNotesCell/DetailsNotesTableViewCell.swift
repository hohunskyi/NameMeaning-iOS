//
//  DetailsTitleTableViewCell.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class DetailsNotesTableViewCell: DetailsBaseTableViewCell {

    @IBOutlet weak var meaningLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func update(object: AnyObject) {
        
        let notes = NSLocalizedString("Notes", comment: "");
        let attrString = NSMutableAttributedString(string: NSString(format: "%@: %@", notes,  (object as! Name).notes  as String) as String)
        attrString.addAttributes([NSFontAttributeName : UIFont.boldSystemFontOfSize(17)], range: NSMakeRange(0, notes.characters.count + 1))
        
        meaningLabel.attributedText = attrString
    }
    
}
