//
//  CustomTableViewCell.swift
//  Serenity3
//
//  Created by Jarne Thorrez on 28/04/2018.
//  Copyright © 2018 Jarne Thorrez. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var container: UIView!
    @IBOutlet var locationImage: UIImageView!
    @IBOutlet var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
