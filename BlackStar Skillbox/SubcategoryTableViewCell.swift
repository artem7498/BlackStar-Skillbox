//
//  SubcategoryTableViewCell.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/16/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class SubcategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var subcategoryImage: UIImageView!
    @IBOutlet weak var subcategoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
