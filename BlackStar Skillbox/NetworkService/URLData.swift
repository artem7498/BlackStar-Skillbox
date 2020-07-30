//
//  URLData.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/21/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation

class URLData {
    static let shared = URLData()
    
    let categoryURL = "https://blackstarshop.ru/index.php?route=api/v1/categories"
    
    let productsURL = "https://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(ProductsViewController.shared.id)"
    
}
