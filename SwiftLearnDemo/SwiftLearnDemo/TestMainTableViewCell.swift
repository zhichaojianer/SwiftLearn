//
//  TestMainTableViewCell.swift
//  SwiftLearn001
//
//  Created by 刘超-EriC on 15/12/1.
//  Copyright © 2015年 刘超. All rights reserved.
//

import UIKit

let TestMainIdentifier = "TestMainIdentifier"

class TestMainTableViewCell: UITableViewCell {

    @IBOutlet weak var ui_headImageView: UIImageView!
    @IBOutlet weak var ui_nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
