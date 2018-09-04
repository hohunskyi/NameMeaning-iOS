//
//  DetailsTitleTableViewCell.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit

class DetailsRecomsTableViewCell: DetailsBaseTableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text =  NSLocalizedString("Recommendations", comment: "");
    }
}