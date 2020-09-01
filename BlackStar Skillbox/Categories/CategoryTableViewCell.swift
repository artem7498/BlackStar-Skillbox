//
//  CategoryTableViewCell.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/13/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    
    
    var category: Category? {
        didSet{
            guard let unwrappedCategory = category else {return}
            
            categoryImage.downloaded(from: "https://blackstarshop.ru/" + unwrappedCategory.iconImage!)
            categoryImage.image = UIImage(named: "shopping-2" /*unwrappedCategory.image ?? "shopping-2"*/)
            categoryNameLabel.text = unwrappedCategory.name
//            print(category?.name)
        }
    }
    
    var subCategory: Subcategory? {
        didSet{
            guard let unwrappedSubCategory = subCategory else {return}
            
            categoryImage.downloaded(from: "https://blackstarshop.ru/" + unwrappedSubCategory.iconImage!)
//            categoryImage.image = UIImage(named: "Спортивный костюм" /*unwrappedSubCategory.iconImage!*/)
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
