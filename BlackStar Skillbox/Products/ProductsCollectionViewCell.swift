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
//            "\(Int((productInfo?.price as! NSString).floatValue))"
            productImage.downloaded(from: "https://blackstarshop.ru/" + unwrappedProducts.mainImage!)
            productPrice.text = "\(Int((unwrappedProducts.price! as NSString).floatValue)) ₽"
            productName.text = unwrappedProducts.name
        }
    }
    
}
