//
//  CustomCell.swift
//  TableViewDemo
//
//  Created by Jony Singla on 8/03/17.
//  Copyright © 2016 Jony Singla. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var txtFieldOne: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
