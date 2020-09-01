//
//  PageCollectionViewCell.swift
//  BlackStar Skillbox
//
//  Created by Артём on 8/29/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Products? {
            didSet{
                guard let unwrappedProducts = product else {return}
                
//                productImageView.downloaded(from: "https://blackstarshop.ru/" + unwrappedProducts)
                
                
//                productImage.downloaded(from: "https://blackstarshop.ru/" + unwrappedProducts.mainImage!)
//    //            productImage.image = UIImage(named: "no data" /*unwrappedProducts.mainImage!*/)
//                productPrice.text = unwrappedProducts.price
//                productName.text = unwrappedProducts.name
            }
        }
}
