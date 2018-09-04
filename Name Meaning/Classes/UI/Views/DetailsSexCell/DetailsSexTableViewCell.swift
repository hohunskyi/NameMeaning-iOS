//
//  DetailsSexTableViewCell.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class DetailsSexTableViewCell: DetailsBaseTableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genderImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func update(object: AnyObject) {
        updateViewWithSex((object as! Name).sex as String)
    }
    
    func updateViewWithSex(sex: NSString)  {
        
        var title = ""
        
        switch sex {
        case "boy":
            genderImage?.image = UIImage(named: "icon_male")!
            genderImage.tintColor = UIColor(red: 54/255, green: 98/255, blue: 187/255, alpha: 1.0)
            title = NSLocalizedString("Male", comment:"")
        
        case "girl":
            genderImage?.image = UIImage(named: "icon_female")!
            genderImage.tintColor = UIColor(red: 199/255, green: 68/255, blue: 52/255, alpha: 1.0)
            title = NSLocalizedString("Female", comment:"")

        
        default:
            genderImage?.image = UIImage(named: "icon_unisex")!
            genderImage.tintColor = UIColor(red: 241/255, green: 146/255, blue: 54/255, alpha: 1.0)
            title = NSLocalizedString("Unisex", comment:"")
        }
        
        let attrString = NSMutableAttributedString(string: NSString(format: "%@: %@", NSLocalizedString("Gender", comment:""), title) as String)
        attrString.addAttributes([NSFontAttributeName : UIFont.boldSystemFontOfSize(17)], range: NSMakeRange(0, 4))
        titleLabel.attributedText = attrString
    }
}
