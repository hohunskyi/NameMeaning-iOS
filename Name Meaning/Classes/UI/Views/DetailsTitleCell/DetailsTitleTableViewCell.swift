//
//  DetailsTitleTableViewCell.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/4/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit
import Cosmos

class DetailsTitleTableViewCell: DetailsBaseTableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func update(object: AnyObject) {
        titleLabel.text = (object as! Name).name as String
        ratingView.rating = Double((object as! Name).rating as String)!
    }
}
