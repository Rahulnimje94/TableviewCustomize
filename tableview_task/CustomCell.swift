//
//  CustomCell.swift
//  tableview_task
//
//  Created by Anand on 05/02/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit


class CustomCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backgroundLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
