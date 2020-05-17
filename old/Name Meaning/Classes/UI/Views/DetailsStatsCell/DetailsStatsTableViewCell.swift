//
//  DetailsTitleTableViewCell.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class DetailsStatsTableViewCell: DetailsBaseTableViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        label.text =  NSLocalizedString("Popularity", comment: "");
    }
}
