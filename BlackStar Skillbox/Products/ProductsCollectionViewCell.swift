//
//  ProductsCollectionViewCell.swift
//  BlackStar Skillbox
//
//  Created by Артём on 8/2/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    
    @IBAction func productBuyButton(_ sender: Any) {
    }
    
    
    var product: Products? {
        didSet{
            guard let unwrappedProducts = product else {return}
            
            productImage.image = UIImage(named: "no data" /*unwrappedProducts.mainImage!*/)
            productPrice.text = unwrappedProducts.price
            productName.text = unwrappedProducts.name
        }
    }
    
}
