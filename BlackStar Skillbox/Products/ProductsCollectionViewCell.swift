//
//  ProductsCollectionViewCell.swift
//  BlackStar Skillbox
//
//  Created by Артём on 8/2/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBAction func productBuyButton(_ sender: Any) {
    }
    
    
    var product: Products? {
        didSet{
            guard let unwrappedProducts = product else {return}
//            "\(Int((productInfo?.price as! NSString).floatValue))"
            productImageView.af.setImage(withURL: URL(string: "https://blackstarshop.ru/" + unwrappedProducts.mainImage!)!)
//            productImageView.downloaded(from: "https://blackstarshop.ru/" + unwrappedProducts.mainImage!)
            productPriceLabel.text = "\(Int((unwrappedProducts.price! as NSString).floatValue)) ₽"
            productNameLabel.text = unwrappedProducts.name
        }
    }
    
}
