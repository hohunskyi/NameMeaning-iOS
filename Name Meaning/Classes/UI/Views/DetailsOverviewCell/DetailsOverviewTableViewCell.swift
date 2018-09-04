//
//  DetailsOverviewTableViewCell.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class DetailsOverviewTableViewCell: DetailsBaseTableViewCell {

    @IBOutlet weak var overviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func update(object: AnyObject) {
        let string = (object as! Name).overview
        let encodedData = string.dataUsingEncoding(NSUTF16StringEncoding)!

        let attributedOptions : [String: AnyObject] = [
            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
            NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
        ]
        
        do {
            let attrString = try NSMutableAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            overviewLabel.attributedText = attrString
        } catch {
            
        }
    }
    
}
