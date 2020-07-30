//
//  CategoryTableViewCell.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/13/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var showProductsButton: UIButton!
    
    var category: Category? {
        didSet{
            guard let unwrappedCategory = category else {return}
            
            categoryImage.image = UIImage(named: unwrappedCategory.image! /*?? "сотовая связь"*/)
            categoryNameLabel.text = unwrappedCategory.name
//            print(category?.name)
        }
    }
    
    var subCategory: Subcategory? {
        didSet{
            guard let unwrappedSubCategory = subCategory else {return}
            
            categoryImage.image = UIImage(named: unwrappedSubCategory.iconImage!)
            categoryNameLabel.text = unwrappedSubCategory.subname
        }
    }

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
